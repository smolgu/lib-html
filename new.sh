SLUG="$(slug "$@")"
echo $SLUG
FNAME="hugo.beget.ru/novosti/$SLUG.html"
echo $FNAME
touch $FNAME
DATE=`date "+%Y-%m-%d %H:%M"`
echo $DATE
echo "title: $@
date: $DATE
----" > $FNAME