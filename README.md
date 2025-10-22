# helvetic

Ubuntu sidecar container with essential debugging and networking tools.  
Designed to run alongside a target container, when needed for troubleshooting, by sharing PID and network namespaces.

For more context, see [https://k-candidate.github.io/2025/10/09/sec-vuln-fatigue-build-troubleshoot-minimal-containers.html](https://k-candidate.github.io/2025/10/09/sec-vuln-fatigue-build-troubleshoot-minimal-containers.html).

## Usage

Attach to target container namespaces:
```bash
docker run --rm -it \
    --user=<uid>:<gid> \
    --pid=container:<target> \
    --network=container:<target> \
    kcandidate/helvetic:latest
```

The default user has the `uid` and `gid` 65532.  
If the target container has the same, then you can skip `--user`.