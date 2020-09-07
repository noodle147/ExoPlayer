# Using ExoPlayer With Transparency Support #
## Only list the differences!! ##

### Binnary ###
Download aar from 
    https://github.com/zxzx74147/ExoPlayer/releases/tag/r2.11.8_transparency 
and import to you project.

### Locally ###
#### Same as Exoplayer ####
Just change git url and the branch.
```sh
git clone https://github.com/zxzx74147/ExoPlayer.git
cd ExoPlayer
git checkout orgin-old/dev-v2-r2.11.8-transparency
```




### Config ###
Just set EXTENSION_RENDERER_MODE_PREFER.
```java
DefaultRenderersFactory(this).setExtensionRendererMode(DefaultRenderersFactory.EXTENSION_RENDERER_MODE_PREFER);
```
