{ lib, config, pkgs, ...}:

let 
  plugin_packages = with pkgs; 
  [
    mda_lv2 
    swh_lv2 
    aether-lv2 
    gxplugins-lv2  
    gxmatcheq-lv2 
    airwindows-lv2 
    rkrlv2 distrho 
    bshapr 
    bchoppr
    plujain-ramp 
    mod-distortion 
    x42-plugins
    # infamousPlugins 
    mooSpace 
    boops
    eq10q 
    talentedhack 
    artyFX 
    fverb
    kapitonov-plugins-pack
    fomp 
    molot-lite
    zam-plugins
    lsp-plugins
    calf 
    ams-lv2  
    # bollie-delay
    guitarix
    # neural-amp-modeler-lv2
    # melmatcheq-lv2
    # mod-pitchshifter # takes ages to build
    # xplugs-lv2 # build fails
    # tunefish # build fails
  ];
  plugin_packages_lv2_dirs = 
    lib.concatStrings (lib.intersperse ":" (lib.forEach plugin_packages (x: "${x}/lib/lv2")));
in
{
  nixpkgs.config.allowUnfree = true;
  
  environment.systemPackages = plugin_packages;

  environment.variables = {
    LV2_PATH = plugin_packages_lv2_dirs;
  };

}
