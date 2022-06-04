// import { join } from "https://deno.land/std@0.142.0/path/mod.ts";
// import { buildContainerImage } from "./build.ts";

// Deno.test({
//   name: "function `buildContainerImage` test",
//   ignore: Deno.build.os === "windows",
//   permissions: { read: true, run: true, env: true },
//   async fn(): Promise<void> {
//     const containerName = "amuse-lang-environment";
//     await buildContainerImage(
//       join(Deno.cwd(), containerName),
//       containerName,
//       "latest",
//     );
//   },
// });
