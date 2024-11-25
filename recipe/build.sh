mkdir -p ${PREFIX}/bin
mv bin/* ${PREFIX}/bin
mkdir -p ${PREFIX}/lib
mv lib/* ${PREFIX}/lib

for i in ${PREFIX}/lib/ollama/libcudart.so ${PREFIX}/lib/ollama/libggml_cuda_v11.so ${PREFIX}/lib/ollama/libggml_cuda_v12.so; do
  patchelf --set-rpath '$ORIGIN' $i
done
