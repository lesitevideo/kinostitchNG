#!/bin/bash

SECONDS=0;
list=(enfused/$1/*.jpg)


echo $((${#list[@]})) fichiers / $((${#list[@]}/4)) panos"<br/>"

nd=$((${#list[@]}/4))

nf=4

# echec si il y a pas au moins 4 jpegs
if [ $nd = 0 ]
then
        echo "Echec"
        exit
fi

for (( i=1; i<=nd; i++ )); do
	filestostitch=${list[@]:(i-1)*nf:nf}
	stitchto="panos/"$1"/pano"$i".jpg"
	
    declare -a ARRAY
	#echo $filestostitch
	#echo "Assemblage "$stitchto
    
    #boucler sur la liste pour replir l'array
    z=0
    for item in $filestostitch
    do
        ARRAY[$z]=$item
        z=$(($z + 1))
    done
    
    #ecrire le .pts
    sh -c 'echo "# ptGui project file
#-encoding utf8
#-pathseparator /
#-fileversion 41
#-previewwidth 1132
#-previewheight 566
#-vfov 180
#-resolution 300
#-fixaspect 1
#-outputfile 
#-ccdcrop 1.5
#-hasbeenoptimized 1
#-hvcpmode 1
#-morphmode 2
#-jpegparameters 100 0
#-tiffparameters 8bit packbits alpha_assoc
#-psdparameters 8bit packbits layered
#-qtvrparameters 800 600 1 1000 70 0 0 -180 180 0 -90 90 90 10 120 1
#-honorexiforientation 1
#-exrparameters noalpha
#-hdroutputhdrblended
#-hdroutputtonemapped
#-hdrfileformat hdr
#-hdrmethod fuse
#-hdrpsdparameters float none layered
#-tonemapsettings 0 0 0.5 1 0 20 0 0 2 0.27 0.67 0.06
#-fusesettings 0.5 0 0.2 0 0
#-cameracurve 3.441228 -0.551975 0.294423 -0.09563199999999999 0.07213899999999999
#-vignettingparams 
#-wbexposure 0 0 0
#-pmoptexposuremode auto
#-pmoptvignettingmode enabled
#-pmoptwbmode disabled
#-pmoptflaremode disabled
#-pmoptcameracurvemode auto
#-exposurecorrection 0
#-blendweight 100 100 100 100
#-optviewpoint 0000
#-colorcorrectlayers
#-useexif1
#-batchbuilder_useexif 0
#-stitcher ptgui
#-blender ptgui
#-blenderfeather 0
#-optimizer ptgui
#-interpolator default
#-simpleproject
#-autocpdone
#-simpleoptimizer
#-imgrotate4444
#-cpinactive
#-imginactive
#-linktoprevious
#-previewinactive
#-outputcrop 0 1 0 1
#-morphcp
#-nooptcp
#-location default
#-viewingdirection default
#-alignsettings_generatecp 1
#-alignsettings_optimize 1
#-alignsettings_optimizeprealign 1
#-alignsettings_straighten 1
#-alignsettings_fit 1
#-alignsettings_chooseprojection 1
#-alignsettings_setoptimumsize 1
#-alignsettings_limitsize 500
#-alignsettings_optimizeexposure 0
#-hdrsettings_defaultlinkmode nolink
#-hdrsettings_donotask 0
#-batchsettings_align 0
#-batchsettings_stitch 1
#-batchsettings_stitchonlyifcontrolpoints 1
#-defaultprojectfilenamemode firstsourceimage
#-defaultprojectfilename_custom " Panorama"
#-defaultprojectfoldermode sourcefolder
#-defaultprojectfolder_custom ""
#-defaultpanoramafilenamemode asproject
#-defaultpanoramafilename_custom ""
#-defaultpanoramafoldermode projectfolder
#-defaultpanoramafolder_custom ""
#-userelativesourceimagepaths 1
#-optimizeraskreinitialize 1
#-applytemplate_lens 1
#-applytemplate_imageparams 1
#-applytemplate_crop 1
#-applytemplate_mask 1
#-applytemplate_panoramasettings 1
#-applytemplate_projectsettings 1
#-applytemplate_optimizer 1
#-globalcrop 0 0 0 0 0 -8.333333333333333e-05 8.333333333333333e-05 0.4714166666666667
#-theoreticalhfov 180
#-rect_compression_x 0
#-rect_compression_y 0
#-cylindrical_compression_y 0
#-transverse_cylindrical_compression_x 0
#-vedutismo_compression_x 1
#-transverse_vedutismo_compression_y 1
#-stereographic_compression 1
#-rectifisheye_compression 1
# Panorama settings:
p w12036 h6018 f2 v360 u20 n"JPEG g0 q100"
m g1 i0 f0

# input images:
#-dummyimage
# The following line contains a dummy image containing some global parameters for the project
o w1 h1 y0 r0 p0 v169.193592521888 a-0.05503476132575054 b-0.03023872528383771 c-0.008549406498178917 f2 d-31.96103385493756 e113.3786068231683 g0 t0
#-imgfile 4000 6000 \"'${ARRAY[0]}'\"
#-metadata -1 -1 100 2017-10-19T14:50:36 3*8 0 1 1 -1 * * * curve 8 * T
#-viewpoint 0 0 0 0 0
#-exposureparams 0 0 0 0
o f2 y-134.937459111628 r-0.03448672256882959 p7.781285438719634 v=0 a=0 b=0 c=0 d=0 e=0 g=0 t=0 C-828,4829,172,5829
#-imgfile 4000 6000 \"'${ARRAY[1]}'\"
#-metadata -1 -1 100 2017-10-19T14:52:02 3*8 0 1 1 -1 * * * curve 8 * T
#-viewpoint 0 0 0 0 0
#-exposureparams 0 0 0 0
o f2 y-44.49834451678586 r-0.05967438678794677 p7.717828659530769 v=0 a=0 b=0 c=0 d=0 e=0 g=0 t=0 C-828,4829,172,5829
#-imgfile 4000 6000 \"'${ARRAY[2]}'\"
#-metadata -1 -1 100 2017-10-19T14:53:35 3*8 0 1 1 -1 * * * curve 8 * T
#-viewpoint 0 0 0 0 0
#-exposureparams 0 0 0 0
o f2 y45.32887190554389 r-0.01881055159685662 p7.8452030151436 v=0 a=0 b=0 c=0 d=0 e=0 g=0 t=0 C-828,4829,172,5829
#-imgfile 4000 6000 \"'${ARRAY[3]}'\"
#-metadata -1 -1 100 2017-10-19T14:55:05 3*8 0 1 1 -1 * * * curve 8 * T
#-viewpoint 0 0 0 0 0
#-exposureparams 0 0 0 0
o f2 y134.937459111628 r-0.1028263846887113 p7.717533263152463 v=0 a=0 b=0 c=0 d=0 e=0 g=0 t=0 C-828,4829,172,5829

# optimizer:
v v a b c d e y2 r2 p2 y3 r3 p3 y4 r4 p4" >> tpl.pts'
        
        #assembler le panorama
		wine PTStitcherNG.exe -c -o $stitchto tpl.pts
		
        #exifs Google OSC
		#echo "Exif panorama ..."
		exiftool -q -overwrite_original -Make=Kinoki.fr -Model=KINOBOT -Software=KINOSTITCH -FullPanoWidthPixels=12036 -FullPanoHeightPixels=6018 -CroppedAreaImageWidthPixels=12036 -CroppedAreaImageHeightPixels=6018 -CroppedAreaLeftPixels=0 -CroppedAreaTopPixels=0 -UsePanoramaViewer=True -ProjectionType=equirectangular -PoseHeadingDegrees=0 $stitchto
		
        #virer le .pts
        rm tpl.pts ${ARRAY[0]} ${ARRAY[1]} ${ARRAY[2]} ${ARRAY[3]}
        
		#echo "fini "$stitchto
	
done

echo "fini de stitcher en "$SECONDS" secondes<br/>"
