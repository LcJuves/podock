export default {
  plugins: [
    "preset-default", // built-in plugins enabled by default
    "removeDimensions",
    "convertStyleToAttrs",
    "removeScriptElement",
    "removeXlink",
    "removeStyleElement",
    "convertOneStopGradients",
    {
      name: "inlineStyles",
      params: {
        onlyMatchedOnce: false,
        removeMatchedSelectors: true,
      },
    },
    {
      name: "removeDesc",
      params: {
        removeAny: true,
      },
    },
    {
      name: "removeUnknownsAndDefaults",
      params: {
        unknownContent: true,
        unknownAttrs: true,
        defaultAttrs: true,
        defaultMarkupDeclarations: true,
        uselessOverrides: true,
        keepDataAttrs: false,
        keepAriaAttrs: false,
        keepRoleAttr: false,
      },
    },
  ],
};