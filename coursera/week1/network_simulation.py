# python3


class Packet:
    def __init__(self, arrived_at, duration):
        self.arrived_at = arrived_at
        self.duration = duration


class Network:
    def __init__(self, buffer_size: int):
        self.packets = []
        self.buffer_size = buffer_size

    def add_packet(self, new_packet: Packet):
        self.__run_garbage_collector(new_packet)
        assert self.__is_free()
        self.packets.append(new_packet)

    def __remove_packet(self, index):
        return self.packets.pop(index)

    def __run_garbage_collector(self, new_packet: Packet):
        for index, packet in enumerate(self.packets):
            if new_packet.arrived_at - packet.arrived_at >= packet.duration:
                self.__remove_packet(index)

    def __is_free(self) -> bool:
        return len(self.packets) < self.buffer_size


def main():
    buffer_size, n = list(map(int, input().split()))
    network = Network(buffer_size)

    packets = []
    for _ in range(n):
        arrived_at, duration = list(map(int, input().split()))
        packets.append(Packet(arrived_at, duration))

    for packet in packets:
        try:
            network.add_packet(packet)
            print(packet.arrived_at)
        except AssertionError:
            print('-1')


if __name__ == '__main__':
    main()
