docker build -t docker-sshd .

docker run --rm \
--publish=2222:22 \
--env ROOT_PASSWORD=password \
docker-sshd

rm -rf /home/sonnyyu/.ssh/known_hosts

ssh root@127.0.0.1 -p 2222
