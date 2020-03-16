# Set a BLENDER_CACHE is not set yet
export BLENDER_CACHE=${BLENDER_CACHE:-"~/.blender_cache"}
rm -rf build/ dist/ *.egg-info
pip3 install -r requirements.txt
pip uninstall blender_addon_tester -y
python3 setup.py bdist_wheel
pip install dist/*.whl
cd examples/testing-*/
pwd
for testable_file in $(ls test_fake_addon*.py); do
  python3 "$testable_file";
done
cd ../..