#priority 5
#modloaded atutils

import mods.immersiveengineering.Mixer;

Mixer.addRecipe(<liquid:glaze_slurry> * 1000, <liquid:water> * 1000, 
    [<minecraft:nether_wart> * 4, <embers:dust_ash> * 4, <minecraft:dye:15> * 4], 20480);

Mixer.addRecipe(<liquid:eutrophic_water> * 1000, <liquid:nutrient_distillation> * 1000, 
    [<teslathingies:dung_block>, <ore:cropNetherWart>], 20480);

Mixer.addRecipe(<liquid:eutrophic_water> * 1000, <liquid:water> * 1000, 
    [<ore:listAllfruit> * 4 ], 20480);
Mixer.addRecipe(<liquid:eutrophic_water> * 1000, <liquid:water> * 1000, 
    [<ore:listAllveggie> * 4], 20480);
Mixer.addRecipe(<liquid:eutrophic_water> * 1000, <liquid:water> * 1000, 
    [<ore:listAllmeatraw> * 2], 20480);