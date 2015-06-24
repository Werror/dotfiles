# Path
export PATH=/usr/local/git/bin:$PATH

# General
alias ll='ls -l'
alias vi='mvim -v'
alias vim='mvim -v'

# Git prompt
source /usr/local/git/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND='__git_ps1 "\u \w" "\\\$ "'

# Git completion
source /usr/local/git/contrib/completion/git-completion.bash

# NVPACK
export PATH="$PATH:/Users/raf/Tools/NVPACK/android-sdk-macosx/platform-tools"
export PATH="$PATH:/Users/raf/Tools/NVPACK/android-sdk-macosx/build-tools"
export PATH="$PATH:/Users/raf/Tools/NVPACK/android-sdk-macosx/tools"
export ANDROID_HOME="/Users/raf/Tools/NVPACK/android-sdk-macosx"
export NDK_ROOT="/Users/raf/Tools/NVPACK/android-ndk-r10d"
export NDKROOT="/Users/raf/Tools/NVPACK/android-ndk-r10d"
export PATH="$PATH:/Users/raf/Tools/NVPACK/android-ndk-r10d"
export NDK_STANDALONE_46_ANDROID9="/Users/raf/Tools/NVPACK/android-ndk-r10d/toolchains/arm-linux-androideabi-4.6/gen_standalone/darwin-x86"
export ANT_HOME="/Users/raf/Tools/NVPACK/apache-ant-1.8.2"
export PATH="$PATH:/Users/raf/Tools/NVPACK/apache-ant-1.8.2/bin"
export GRADLE_HOME="/Users/raf/Tools/NVPACK/gradle-2.1"
export PATH="$PATH:/Users/raf/Tools/NVPACK/gradle-2.1/bin"
export NVPACK_ROOT="/Users/raf/Tools/NVPACK"
export PATH="$PATH:$NDK_ROOT"

# Shomi
alias cdshomi="cd /Users/raf/Workspaces/Shomi/Project"
alias cduswish="cd /Users/raf/Workspaces/Shomi/Project/uswish"
