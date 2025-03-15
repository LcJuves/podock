export default {
  plugins: [
    "preset-default", // built-in plugins enabled by default
    "mergeStyles",
    {
      name: "inlineStyles",
      params: {
        onlyMatchedOnce: false,
        removeMatchedSelectors: true,
      },
    },
    "removeComments",
    "removeDesc",
    "mergePaths",
    "convertColors",
    "collapseGroups",
    "cleanupIds",
    "cleanupAttrs",
    "convertStyleToAttrs",
    "removeHiddenElems",
    "removeScriptElement",
    "removeUselessDefs",
    "removeUselessStrokeAndFill",
    "removeEmptyAttrs",
    "convertColors",
    {
      name: "convertTransform",
      params: {
        convertToShorts: true,
        floatPrecision: 3,
        transformPrecision: 5,
        matrixToTransform: true,
        shortTranslate: true,
        shortScale: true,
        shortRotate: true,
        removeUseless: true,
        collapseIntoOne: true,
      },
    },
    "sortAttrs",

    {
      name: "minifyStyles",
      params: {
        usage: true,
      },
    },
  ],
};
