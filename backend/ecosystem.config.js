module.exports = {
  apps: [
    {
      name: "thenobody-services-api",
      script: "./src/services/api/index.ts",
      interpreter: "./node_modules/ts-node/dist/bin.js",
      args: "--max-old-space-size=4096",
      instances: "1",
      exec_mode: "fork",
      watch: ["./src/services/api/"],
      ignore_watch: ["node_modules", ".git"],
    },
  ],
};
