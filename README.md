# vllm-llamacpp-speed-tests
I'll run vllm and llamacpp using docker on quantized llama3 (awq for vllm and gguf for cpp). I'll send requests to both and check the speed.

Notice vllm processes a single request faster and by utilzing continuous batching and page attention it can process 10 requests before llamacpp returns 1.

Now continuous batching can be used with llamacpp, but it needs to be configured in the server and then fixes the context length per batch. e.g. if you have
a context length of 1024 and use --parallel 4 then each request can only use 256 context tokens, even if only one request is sent.

However, when using this I seemed to receive nonsense. Potentially I haven't set the parameters up correctly.

VLLM seems to be the clear winner.

Machine specs : 8GB NVIDIA 3070M GPU