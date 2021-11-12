#priority 5
#modloaded atutils

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;

import mods.modularmachinery.RecipeBuilder;

var recipes as int[][int] = {
    1 : [8 , 8 * 20, 4800],
    2 : [16, 16 * 20, 9600],
    3 : [24, 24 * 20, 14400],
    4 : [32, 32 * 20, 19200],
    5 : [40, 40 * 20, 24000]
};

for key, value in recipes {
    RecipeBuilder.newBuilder("fmph_mk" ~ key ~ "_recipe_" ~ value[0], "fmph_mk" ~ key, value[1])
        .addItemInput(<botania:fertilizer>.withAmount(value[0]))
        .addManaOutput(value[2])
        .build();
}