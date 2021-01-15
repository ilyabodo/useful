# Tensorflow

#### Force tensorflow to use single GPU
```
gpus = tf.config.experimental.list_physical_devices('GPU')
assert len(gpus) > 0, "Not enough GPU hardware devices available"
config = tf.config.experimental.set_memory_growth(gpus[0], True)
os.environ["TF_FORCE_GPU_ALLOW_GROWTH"]="true"
```

#### Force tensorflow to use CPU when GPU is enabled
```
os.environ['CUDA_VISIBLE_DEVICES'] = '-1'
```

#### Supress tensorflow warnings
```
tf.compat.v1.logging.set_verbosity(tf.compat.v1.logging.ERROR)
```