
function tf_init() {
  . ~/tensorflow/bin/activate
  export TF_MODELS=$HOME/work/personal/tf-models
  export PYTHONPATH=$TF_MODELS:$TF_MODELS/slim
}
