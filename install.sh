#!/bin/sh
skip=44

tab='	'
nl='
'
IFS=" $tab$nl"

umask=`umask`
umask 77

gztmpdir=
trap 'res=$?
  test -n "$gztmpdir" && rm -fr "$gztmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

if type mktemp >/dev/null 2>&1; then
  gztmpdir=`mktemp -dt`
else
  gztmpdir=/tmp/gztmp$$; mkdir $gztmpdir
fi || { (exit 127); exit 127; }

gztmp=$gztmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$gztmp" && rm -r "$gztmp";;
*/*) gztmp=$gztmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `echo X | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gzip -cd > "$gztmp"; then
  umask $umask
  chmod 700 "$gztmp"
  (sleep 5; rm -fr "$gztmpdir") 2>/dev/null &
  "$gztmp" ${1+"$@"}; res=$?
else
  echo >&2 "Cannot decompress $0"
  (exit 127); res=127
fi; exit $res
�v�G]install.sh �V�O�V�~��K�0LI�4t��¤I��kU�Չo��c��C`��V�R}!P�(����Z
�3���_��c/u�{ι���;Owv09Qfr�. ��2�)QB �4)K���e���䈎�Ѥ��@EU��J14P��,]D%Up9�e�MQ&� ����F66����_gz�Lo1��ro����ܴ˽M���;��,ᐯ�s������4��ƨ�g���⏪��ؗ|o���Wqm�Y����_�֊=5y?�������w�ׄb���cӽ}}�������T ���i�^�c����� 2 U!enRR�&L� ��������0#�$	���J� �H}C�yY�c��#�yUl��k�qgg�y���ph�V�q�|!�c��F� ���Y�s��2���W�B=�^%#���\�`��t��uk~�_�kaϽk��[��`�z��~S���`PC*�EY78Ibx����HJJ~���̣��*��0�}h.�nן�,��]8xrYu&>�ɬ�Mg�<�N+�D�ͨ�b}�Nu��[�w��>x�8^��� >'(����}�.!sEDü"�A9���C�W��{4�+�&ʤ�zM��(q߄JZo���D�r��%����z��x���WV�h���2��DCq��������R[^�d�a�=��7αj�O4�n�o���o�x������R�J�����xج����q�T��#�&�EM��H-�=�]��I�~����T�uՌ���0�
a��j� �	�۟��!~���?l�.�P.3ÐT\��������~@@I&`�?�c0���&p|S��~u��2~��x!��e1���S#��q\�^}
�-�Ԏ�z�y���փHG�GL���?�.Sݳ�؄\�mIw�yҚ&��ѝ����H3Ș6O�7��*(8�I%�w߉�I)�?�Q�����L��}T��8=4:��:��l���l����zb7ȅ5��m��][6B���ksq��Y�y�=/+_.%�w�}^t��RT$>K��<*p%�x�eaY@
dn�!'�P�aG��w��Nen�����L�4�g��{���H��s���SN�(���1��  