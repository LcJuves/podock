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

    {
      name: "minifyStyles",
      params: {
        usage: true,
      },
    },
  ],
};
