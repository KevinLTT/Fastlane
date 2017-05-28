#include <stdio.h>
#include <stdint.h>

struct _UP_HEADER
{
    uint8_t m_cVersionAndHeaderLen;
    uint8_t m_cTypeOfService;
    uint16_t m_sTotalLenOfPacket;
    uint16_t m_sPacketID;
    uint16_t m_sSliceinfo;
    uint8_t m_cTTL;
    uint8_t m_cTypeOfProtocol;
    uint16_t m_sCheckSum;
    uint32_t m_uiSourIP;
    uint32_t m_uiDestIp;
};

int main(  )
{
    printf( "%d\n", sizeof( struct _UP_HEADER ) );

    return 0;
}