# 定义可能的 Android SDK 路径
possible_sdk_paths=(
  "$HOME/Library/Android/sdk"
  "$HOME/Android/Sdk"
  "/usr/local/share/android-sdk"
)

# 检查每个路径，如果存在，则配置环境变量
for sdk_path in "${possible_sdk_paths[@]}"; do
  if [[ -d "$sdk_path" ]]; then
    export ANDROID_HOME="$sdk_path"
    export PATH="$PATH:$ANDROID_HOME/emulator"
    export PATH="$PATH:$ANDROID_HOME/tools"
    export PATH="$PATH:$ANDROID_HOME/tools/bin"
    export PATH="$PATH:$ANDROID_HOME/platform-tools"
    break # 找到有效路径后退出循环
  fi
done
