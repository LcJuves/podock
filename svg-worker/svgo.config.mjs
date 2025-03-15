export default {
  plugins: [
    "preset-default", // built-in plugins enabled by default
    "mergeStyles",
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
    "removeEmptyContainers",
    "convertColors",
    "sortAttrs",
    {
      name: "inlineStyles",
      params: {
        onlyMatchedOnce: false,
        removeMatchedSelectors: true,
      },
    },
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
    {
      name: "minifyStyles",
      params: {
        usage: true,
      },
    },
  ],
};
