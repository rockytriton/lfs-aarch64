set -e
echo "start"
true && false || echo "no"
false && true
echo "one"
asdf && true
echo "two"
asdf && false
echo "end"

