#priority 20
#modloaded atutils
#loader contenttweaker

import crafttweaker.world.IBlockPos;
import mods.contenttweaker.VanillaFactory;
import mods.randomtweaker.naturesaura.IAuraChunk;
import mods.randomtweaker.cote.ISubTileEntityFunctional;
import mods.randomtweaker.cote.ISubTileEntityGenerating;

var auraFlower as ISubTileEntityFunctional = VanillaFactory.createSubTileFunctional("aura_flower", 0x4444FF);
auraFlower.range = 4;
auraFlower.maxMana = 8000;
auraFlower.acceptsRedstone = true;
auraFlower.onUpdate = function(subtile, world, pos) {
    if(subtile.getTicksExisted() % 80 == 0 && subtile.getRedstoneSignal() <= 0) {
        var auraLowestPos = world.getLowestSpot(pos, 4, pos);
        var auraChunk as IAuraChunk = world.getAuraChunk(auraLowestPos);

        if(subtile.getMana() >= 800 && !isNull(auraChunk)) {
            if(world.remote) {
                world.playSound("botania:endoflame", "block", pos.asPosition3f(), 0.2F, 0.1F);
            } else {
                subtile.consumeMana(800);
                auraChunk.storeAura(auraLowestPos, 1600);
            }
        }
    }
};
auraFlower.register();

var manaFlower as ISubTileEntityGenerating = VanillaFactory.createSubTileGenerating("mana_flower", 0x4444FF);
manaFlower.range = 4;
manaFlower.maxMana = 8000;
manaFlower.acceptsRedstone = true;
manaFlower.onUpdate = function(subtile, world, pos) {
    if(subtile.getTicksExisted() % 80 == 0 && subtile.getRedstoneSignal() <= 0) {
        var auraHighestPos as IBlockPos = world.getHighestSpot(pos, 4, pos);
        var auraChunk as IAuraChunk = world.getAuraChunk(auraHighestPos);

        if(!isNull(auraChunk) && subtile.getMaxMana() != subtile.getMana()) {
            if(world.remote) {
                world.playSound("botania:endoflame", "block", pos.asPosition3f(), 0.2F, 0.1F);
            } else {
                auraChunk.drainAura(auraHighestPos, 1600);
                subtile.addMana(800);
            }
        }
    }
};
manaFlower.register();