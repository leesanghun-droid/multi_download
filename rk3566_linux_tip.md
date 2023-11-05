## tip

 - git clone 에러</br>
    > https://worldclassproduct.tistory.com/entry/Could-not-resolve-host-githubcom-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95</br>
    >/etc/resolv.conf 을 아래와 같이 편집</br>
    >   run "systemd-resolve --status" to see details about the actual nameservers.</br>
        nameserver 127.0.0.53</br>
        nameserver 8.8.8.8</br>
        nameserver 8.8.4.4</br>
        options edns0 trust-ad</br>