# How to run:
   export PERCY_TOKEN=auto_<>

   npx percy exec --verbose -- browserstack-sdk robot test.robot
   
# Error details:

19:11:14 [browserstack_sdk.__init__][INFO] - View build on BrowserStack dashboard: https://automate.browserstack.com/dashboard/v2/builds/45c8255fa9e23534fbbc45cdc00ff8d103d2d080

19:11:14 [browserstack_sdk.__init__][INFO] - Handling session close

19:11:14 [browserstack_sdk.__init__][INFO] - Stopping Browserstack Local

19:11:17 [browserstack_sdk.__init__][INFO] - All done!

[percy:core:queue] Clearing discovery queue, queued state: 0, pending state: 0 (6340ms)

[percy:core:browser] Closing browser (0ms)

[percy:core:browser] Browser closed (0ms)

[percy:core:queue] Clearing snapshot queue, queued state: 0, pending state: 0 (0ms)

[percy:client] Finalizing build 37551191... (0ms)

[percy:timer] client:post - build.finalze - 0.114s (114ms)

[percy:core] Finalized build #25: https://percy.io/d1902a5f/ca-visual-regression-automate/builds/37551191 (0ms)

[percy:core] Detected error for percy build (0ms)

[percy:core] Failure: Snapshot command was not called (0ms)

[percy:core] Failure Reason: Snapshot Command was not called. please check your CI for errors (1ms)

[percy:core] Suggestion: Try using percy snapshot command to take snapshots (0ms)

[percy:core] Refer to the below Doc Links for the same (0ms)

[percy:core] * https://www.browserstack.com/docs/percy/take-percy-snapshots/ (0ms)

[percy:client] Sending Build Logs (209ms)

[percy:timer] client:post - build.send_logs - 0.303s (304ms)

[percy:core] Build's CLI and CI logs sent successfully. Please share this log ID with Percy team in case of any issues - 37551191_build_37551191_cli_16b0f2065e208f0e6f7bba255a0c00f38c9c2d54 (1ms)

[percy:cli:exec] Command "browserstack-sdk robot test.robot" exited with status: 0 (0ms)



# Versions: 

- @percy/cli 1.30.2
- Python 3.12.4
- Robot Framework 7.0 
