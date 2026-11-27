Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783281;
	b=FRRq9K491zp+e1ZsXZwbhiSCpMNuX/kEMXm3kJWajJoz66dXJDtYmUSrtQ48R/rtysDx
	 hvhB70j6thEMMTc0SGV3wm+pOxcBoV9R3ZIuwuerSBA4nP0BHsrX9o+N6aKE26OtKWRG5
	 OIAQE1sWJ5/GErTC8qT6SVInWcffykBS6u1roAywmPzswYdSkyK6FYDjGeoK/GYMJhTkT
	 JbIpmu0fuke02rculi7Um9kptJ7rzx8Xpel4/BYThgK71iF+VrdW2kkwvxVxfaKGA2x92
	 0H2jI9YDF7Ol1UpmVEUNaaSVM/ZUUXJZ7JOvkwadABNXRZRJKgoeolvE1EyKDNzFVsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783281;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eRduKSj+ay0AaaB0FCrKgVdtVhwmHGGtiObIIGugzio=;
	b=v7pra3AIMOOlsWrB2MfYByxdMNM750rJxIEbr5VcYsdYttIVrY7PqRjd+q431zTHepBM
	 wprhkI+vuVCINiYgPLoroUcOYRQaoZ3iR6dW2zKGqdGpd8QMv7VSX4SujruzSyftyo5fL
	 9CjuNedsDPiAIZ4D55T2xXAuotYaYDWhsigGPRwd47GmtUaH7dqcrWhzU3X72NVnBadL0
	 Qmuc5nW/ddCb+qXbE/ELWIiN/lMQzjbPM4gHB6tcWItgPnqrtNfJV6N1vJsG6YgtQwfz+
	 vcrC0zmvMiIvkp2tarB1fOLRFuF9N5qA59BYPRnLQT8EObeE/o5Sh0tqF2fFr6KZ82g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=Prrrlv7v;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB3E606A33A
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 12:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB3E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=Prrrlv7v
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783278;
	bh=lihAMyNuDkSZGUHxkCpvuCknQG6jTOpSPCv2rgTjWms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Prrrlv7vIUi8q8JY9fZRv1jmaR062tnS+bGacw8uX5Jz4yKpRfVp6EzOSu3bKi0jF
	 OBtXxSPnqwkcOT2PeDoMLK7yMxvecagRJ6yOtG1Jxbi1+2psBOuipsJAefgGjXenL7
	 F0SSuuUPIRsCV5OWeeGUkJnzmwHQmR727WZgs+QINaPiT6PplSpUyPFG1IRplqq6rX
	 qN+WSAhPJGNcyzYqAm6wUx88W+5g+NT733MLYGlRS1WYn94mNdRAbGyFvq4S3oCMXH
	 ZK1zMZELectTooH2mpP8L4QbHWr3Mi8hKJJ4Hz2+vk95Vwx6/71C1/nA1BQ0iQEHa0
	 N9ut5Yx1MO+mQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 4/6] wifi: brcmfmac: add the AWDL data path
Date: Fri, 27 Nov 2026 13:41:02 +0100
Message-ID: <20261127124104.233236-5-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124104.233236-1-dev@deq.rocks>
References: <20261127124104.233236-1-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
and the ethertype.

Let the AWDL network device send and receive plain Ethernet frames.
brcmf_netdev_start_xmit() adds the headers and brcmf_netif_rx() removes
them, so both count Ethernet frames. The addresses of received frames
are moved so that they form an Ethernet header with the ethertype
again, which keeps packet taps consistent.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/awdl.c        | 87 +++++++++++++++++++
 .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
 .../broadcom/brcm80211/brcmfmac/core.c        | 17 ++++
 3 files changed, 113 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
index 258d5238705e..1c06a57eb362 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
@@ -8,11 +8,25 @@
  * an interface of type AWDL with interface_create and configures it through
  * the awdl_* iovars. The AWDL interface has a network device but no cfg80211
  * vif. Its interface events are handled here and not by cfg80211.
+ *
+ * The firmware passes AWDL data frames as 802.3 frames with an LLC/SNAP
+ * header with the Apple OUI and an AWDL data header:
+ *
+ *   aa aa 03 00 17 f2 08 00   LLC/SNAP, OUI 00:17:f2, protocol 0x0800
+ *   03 04                     AWDL data header
+ *   seq (le16) 00 00          sequence number, reserved
+ *   ethertype (be16)
+ *
+ * The network device of the AWDL interface sends and receives plain
+ * Ethernet frames. The header is added before frames are sent and removed
+ * from received frames.
  */
 
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
+#include <linux/skbuff.h>
+#include <linux/unaligned.h>
 
 #include "core.h"
 #include "debug.h"
@@ -26,6 +40,14 @@
 #define BRCMF_AWDL_IFIDX		2
 #define BRCMF_AWDL_IF_TIMEOUT		msecs_to_jiffies(2000)
 
+/* LLC/SNAP with the Apple OUI and the start of the AWDL data header */
+static const u8 brcmf_awdl_llc[10] = {
+	0xaa, 0xaa, 0x03, 0x00, 0x17, 0xf2, 0x08, 0x00, 0x03, 0x04,
+};
+
+#define BRCMF_AWDL_SEQ_OFF		10
+#define BRCMF_AWDL_ETHERTYPE_OFF	14
+
 /* The BSSID of all AWDL frames */
 static const u8 brcmf_awdl_bssid[ETH_ALEN] = {
 	0x00, 0x25, 0x00, 0xff, 0x94, 0x73,
@@ -276,6 +298,71 @@ int brcmf_awdl_del(struct brcmf_pub *drvr)
 	return err;
 }
 
+/**
+ * brcmf_awdl_encap() - add the AWDL data header to a frame to be sent.
+ *
+ * @ifp: the AWDL interface.
+ * @skb: Ethernet frame, an 802.3 frame on return.
+ *
+ * Called in the transmit path of the AWDL network device, which serializes
+ * it.
+ *
+ * Return: 0 or a negative error code, the caller frees @skb on error.
+ */
+int brcmf_awdl_encap(struct brcmf_if *ifp, struct sk_buff *skb)
+{
+	struct brcmf_awdl *awdl = &ifp->drvr->awdl;
+	__be16 proto;
+	u8 *hdr;
+
+	if (skb->len < ETH_HLEN || skb_cow_head(skb, BRCMF_AWDL_HDR_LEN))
+		return -EINVAL;
+
+	proto = eth_hdr(skb)->h_proto;
+	hdr = skb_push(skb, BRCMF_AWDL_HDR_LEN);
+	memmove(hdr, hdr + BRCMF_AWDL_HDR_LEN, 2 * ETH_ALEN);
+	put_unaligned_be16(skb->len - ETH_HLEN, hdr + 2 * ETH_ALEN);
+	hdr += ETH_HLEN;
+	memcpy(hdr, brcmf_awdl_llc, sizeof(brcmf_awdl_llc));
+	put_unaligned_le16(awdl->tx_seq++, hdr + BRCMF_AWDL_SEQ_OFF);
+	put_unaligned_le16(0, hdr + BRCMF_AWDL_SEQ_OFF + 2);
+	put_unaligned(proto, (__be16 *)(hdr + BRCMF_AWDL_ETHERTYPE_OFF));
+	skb_reset_mac_header(skb);
+	return 0;
+}
+
+/**
+ * brcmf_awdl_decap() - remove the AWDL data header from a received frame.
+ *
+ * @skb: frame after eth_type_trans(), an Ethernet frame on return.
+ *
+ * The addresses are moved behind the AWDL data header, where they form an
+ * Ethernet header with the ethertype of the AWDL data header.
+ *
+ * Return: 0 or a negative error code for frames that are not AWDL data
+ * frames.
+ */
+int brcmf_awdl_decap(struct sk_buff *skb)
+{
+	__be16 proto;
+	u8 *eth;
+
+	if (skb->protocol != htons(ETH_P_802_2) ||
+	    !pskb_may_pull(skb, BRCMF_AWDL_HDR_LEN) ||
+	    memcmp(skb->data, brcmf_awdl_llc, sizeof(brcmf_awdl_llc)) ||
+	    skb_cow_head(skb, 0))
+		return -EINVAL;
+
+	proto = get_unaligned((__be16 *)(skb->data + BRCMF_AWDL_ETHERTYPE_OFF));
+	eth = skb->data + BRCMF_AWDL_HDR_LEN - ETH_HLEN;
+	memmove(eth, skb_mac_header(skb), 2 * ETH_ALEN);
+	skb_pull_rcsum(skb, BRCMF_AWDL_HDR_LEN);
+	skb_set_mac_header(skb, -ETH_HLEN);
+	skb_reset_network_header(skb);
+	skb->protocol = proto;
+	return 0;
+}
+
 /* Called before the interfaces of the device are removed */
 void brcmf_awdl_detach(struct brcmf_pub *drvr)
 {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
index d9f5b6cc12ad..bbeaa9731f59 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h
@@ -13,6 +13,8 @@
 
 struct brcmf_pub;
 struct brcmf_if;
+struct net_device;
+struct sk_buff;
 
 /**
  * struct brcmf_awdl - AWDL interface of a device.
@@ -29,6 +31,7 @@ struct brcmf_if;
  * @removing: interface_remove was sent, its interface event is awaited.
  * @detached: the device goes away, no new AWDL interface is created.
  * @ifp: the AWDL interface, NULL when there is none.
+ * @tx_seq: sequence number of the next data frame sent.
  */
 struct brcmf_awdl {
 	spinlock_t lock; /* AWDL state against the event worker */
@@ -40,8 +43,12 @@ struct brcmf_awdl {
 	bool removing;
 	bool detached;
 	struct brcmf_if *ifp;
+	u16 tx_seq;
 };
 
+/* Length of the LLC/SNAP and AWDL data header of AWDL data frames */
+#define BRCMF_AWDL_HDR_LEN		16
+
 void brcmf_awdl_attach(struct brcmf_pub *drvr);
 void brcmf_awdl_detach(struct brcmf_pub *drvr);
 int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
@@ -49,5 +56,7 @@ int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
 int brcmf_awdl_del(struct brcmf_pub *drvr);
 bool brcmf_awdl_if_added(struct brcmf_pub *drvr, struct brcmf_if *ifp);
 bool brcmf_awdl_if_removed(struct brcmf_pub *drvr, struct brcmf_if *ifp);
+int brcmf_awdl_encap(struct brcmf_if *ifp, struct sk_buff *skb);
+int brcmf_awdl_decap(struct sk_buff *skb);
 
 #endif /* BRCMFMAC_AWDL_H */
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 5efaec7fc9a4..859f97f8e98b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -309,6 +309,15 @@ static netdev_tx_t brcmf_netdev_start_xmit(struct sk_buff *skb,
 		goto done;
 	}
 
+	/* tx_bytes counts the Ethernet frame, the AWDL header is added here */
+	if (ifp->awdl) {
+		ret = brcmf_awdl_encap(ifp, skb);
+		if (ret) {
+			dev_kfree_skb(skb);
+			goto done;
+		}
+	}
+
 	/* Some recent Broadcom's firmwares disassociate STA when they receive
 	 * an 802.11f ADD frame. This behavior can lead to a local DoS security
 	 * issue. Attacker may trigger disassociation of any STA by sending a
@@ -422,6 +431,12 @@ void brcmf_netif_rx(struct brcmf_if *ifp, struct sk_buff *skb)
 		return;
 	}
 
+	if (ifp->awdl && brcmf_awdl_decap(skb)) {
+		ifp->ndev->stats.rx_dropped++;
+		brcmu_pkt_buf_free_skb(skb);
+		return;
+	}
+
 	ifp->ndev->stats.rx_bytes += skb->len;
 	ifp->ndev->stats.rx_packets++;
 
@@ -693,6 +708,8 @@ int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
 		ndev->netdev_ops = &brcmf_netdev_ops_pri;
 
 	ndev->needed_headroom += drvr->hdrlen;
+	if (ifp->awdl)
+		ndev->needed_headroom += BRCMF_AWDL_HDR_LEN;
 	ndev->ethtool_ops = &brcmf_ethtool_ops;
 
 	/* set the mac address & netns */
-- 
2.56.0

