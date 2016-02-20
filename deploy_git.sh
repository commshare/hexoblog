GUADAZI_WIKI_HOME=~/devkit/guadazi-wiki
KANBOX_EM_HOME=~/kuaiPan/快盘/EM/markdown

cd $KANBOX_EM_HOME
#cd ~/Kanbox_aaronebusiness/EM/markdown/
cp -rf $KANBOX_EM_HOME/images/* $GUADAZI_WIKI_HOME/source/images/
#cp -rf ./images/* ~/devkit/guadazi-wiki/source/images/
cp -rf $KANBOX_EM_HOME/projects/* $GUADAZI_WIKI_HOME/source/projects/
rm -rf $GUADAZI_WIKI_HOME/source/_posts/*


cp $KANBOX_EM_HOME/*.md $GUADAZI_WIKI_HOME/source/_posts 
cp ./nav/index.md $GUADAZI_WIKI_HOME/source/nav/index.md
cp ./im/plans.md  $GUADAZI_WIKI_HOME/source/plans/index.md

cd $GUADAZI_WIKI_HOME
hexo clean 
hexo g
hexo d

cd $KANBOX_EM_HOME
