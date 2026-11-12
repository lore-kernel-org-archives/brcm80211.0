Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506280;
	b=jvc6YIH/riflgKAlQl3m6UTew6Q+ueXpN5bgyShtfNyDwAm8nWDYTf3TxMaSO/mTWqJ/
	 XSl8SIaKiLbqdtr/5VeZqzx5LbWeLli7av9vAx9vzQVq8nHr/DZjSLrlHZwZp4efEZi8m
	 /J5+CRcf6PPGZM8Jq4Atk+TDWH3zDkN5W7YWcWgPEV9MbYEyz1nRdpUqeaGcOdqSWj3s9
	 ZtRV1t8X9ev5B9qfhbDhe5QWP4Ss3L9iSrWEQ8ePTcDUjpjCpmwSmapkZDpi52dhXfU7E
	 /YWUCjP3gDE+SSmdZ2tzLMHSzki3yYdCx7pBSmFzKJ46ueaMo66qMhyA9NIBf84QJag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
	b=eAEWZ0g1dbDWPD1xhH50a2A44APoPhzVmu4XydS8hCuqQyB6y+DlyB5MBCtbEWwktXrn
	 OJW54+GG0cECP0GVXOOT25DixpxzLkYSzVbK7S2hjNW5danA9mf8U0upH6ibvkmJF4C22
	 Vo4yGWVHy60xIs3P9WYVzi1LbGaqkgmiExQ6V/m/Ii7D7cREIbfmutr7GNw/VW/w185ne
	 NO1dHpQz+zETpJcd1JhCkWQHN+0S8ltjHESdwEe0gNPXK/xmbJ8pJl3Vjy4cl+FURpqQ6
	 4zapG2OfyXyCGudIDlpAsFk2XD6Mz7Ql5Liy1dTeF5SQwJVNx0eConA4T5XuAAjYS4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ME5NbkGP;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB9D606A323
	for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 17:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EB9D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ME5NbkGP
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so1819786a12.1
        for <brcm80211@lists.linux.dev>; Thu, 12 Nov 2026 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794506278; x=1795111078; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
        b=ME5NbkGPwRSC5Z2pll6DQPMzXmd3/tiBejv96GkGeKHvay+q/S3JbVdfmbrmjEmV5m
         9V5a0uMvhBQmiU2iByUQ9dmElm34gCo2grCVlhnpvW7u88dtoRa5e/AbFBCDke5LRlWM
         v6yy53IRfb8uP5Ha7BwMUkYPbr19cxLXMaw1CvEXiws/GU+MA7DIogdT5HBVXEFFqmly
         hHRcFofJ3F10Up2b8J3mIXnlCpjCw1w0gG9XmHpWWkjPGhkhkyXrTaK+QPiEdW1AbvpY
         jEYN4i3rwK83IiFto9myac9lTYrUndLscETncGmF/ZbajByEaa8v62sHuaxQlqIRriTX
         07QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506278; x=1795111078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xUH9TM8D+EtFaS7lpDrYmCTRC7yvn6WPuIywYJpBvYg=;
        b=KeNmJA63Nd68CIg+IHTuutfjD72FZyvjlQE5qbTjmW9tPdwwGt4zJJ/aNwy32qwkLv
         rc3kJKQySUTSL0A0xKyGX2hQ2DKTltR9emYyMvfVVfGME9rqMuVKiNAiwzsFHcEqJlYD
         p/KC68xiI8Nu3B+WhnZ2mrhvXPdfDDDI/fnyKAynjRYTihYo/i7GhP0b9HVWP9mYi1Mv
         XYe9ee4hvJaslPl6ydCNvbFbGxDcfmwhOcQj6kdasnyLna9z4d6Sg28pWYU0LAAmBbXF
         ulN4erL9Lp6F7wLMZR1oAgLBiLh4ItqeDoKRGfyaWsMhLLyL/z2c+WdSzyQ900TOqPQv
         HzhQ==
X-Forwarded-Encrypted: i=1; AL+hErEA+bx105/zii3o/Zp0L20w0keOX7LYBwbmDpu+soO06gGHmvoOxTIMnCLmgOZnbI5QQ4XgChXaQVk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+9et1DhvIOShdu5qnILEe3MR2n725A7m12oz9Spf87nFQ8+uPu
	AGtg93Et3C2CDO+Fdvbe1eyhZvAyqldWzbtPUjmkgKXMHfF0sySMACja
X-Gm-Gg: AYBFou2yqAl3LRoxGZEw3/sahpsQe9DEQdKVWaLam0pR7jEoe9DO0U7JCBulHVemTMW
	UuckrjSiF2l+vKx5pgMHgmtQQKkk+rX7l3yddU5EbJ+M35nheC2oYhKDGVSNI+Uje1ZMEgnAcWK
	T2/buQMPYL7SA6EqkLt8O2dirYZeqFNk2KELmX4RJnrc7eMAIJjZy8RFRW6HAfDmM8CHa5Q9vwB
	VWWjCtOvYZvtawrao+p5aqyHSRhR2+Ai+3yU663cqv03QTueaUzbVdXRIvUNo/63eharWk3Mm4w
	wsvEljal6x/3J4eNf9CbZTT3WPcVx0zbMHExKFPo1iqwVL1wC8LzYyx1jkOMFinABpSuFRaK8zD
	ZrSLkQfo7ILW+k+j9amncR0ktb7I75SUO0MXu2Q5zxGRRn+uuhFPuvOzy2Lfd7Ghr3UphJlAedc
	e7IydNk9/Utu9GzpQy0LtC1M8lxhG90e7xZA9cIH1xrSAswIjcZezmrqJX8Ufb6YTihPO1APbkG
	Q9fxbcMQw3fJdG7vBPGitNastVg8WImIhO/d1CesHFCgfivTOU7yiPESmlVEiRCS4XSc+6vqcw0
	cfqoM9IqZo333pAo338eHTwy1HttI764XRkasqTY
X-Received: by 2002:aa7:c706:0:b0:6b7:a647:d6ec with SMTP id 4fb4d7f45d1cf-6b7c0ba594cmr249234a12.5.1794506277847;
        Thu, 12 Nov 2026 09:57:57 -0800 (PST)
Received: from kordpc.lan ([2a13:e746:396c:c600::8fa])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b5606sm18111a12.2.2026.11.12.09.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:57:57 -0800 (PST)
From: Kordian Chmielewski <kudzo51@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Thu, 12 Nov 2026 18:57:54 +0100
Message-ID: <20261112175754.396469-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
flowring to reach zero before it sends the delete. When the wait times
out, it sets the counter to zero with packets still out. Their tx status
still comes and takes the counter below zero, and since the counter
lives in the commonring of the flowid and nothing resets it, the next
flowring that gets the flowid starts from there. With the counter below
zero, the next delete of that flowring waits until it times out as well.

A tx status can also come after the flowid has been released:
brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
control complete ring, so when the firmware writes the tx status of a
packet shortly before the delete response of its flowring, the host can
see the response in one pass and the status only in the next one, after
brcmf_msgbuf_remove_flowring() has released the flowid. If a new
flowring got the flowid in the meantime, the status decrements its
outstanding_tx, which brcmf_msgbuf_schedule_txdata() and the trickle
check in brcmf_proto_msgbuf_rx_trigger() rely on.

Reset the counter when a flowring is created. Give each flowid a
generation that goes up when the flowid is released, and keep it in the
tx pktid of every packet posted to the flowring. A tx status of an older
generation still releases its packet, but no longer touches the counter.

Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
---

Notes:
    v2:
    - sent on its own, as Andre asked; v1 was on top of his series:
      https://lore.kernel.org/all/20261111195559.160650-1-kudzo51@gmail.com/
    - based on wireless-next, so it now also resets the counter when a
      flowring is created. Andre's 4/4 adds the same line:
      https://lore.kernel.org/all/20261107154810.89780-5-dev@deq.rocks/
    - "This happens whatever order the firmware sends the two messages in"
      was too strong, it can happen
    
    The counter carrying over and its effect on the next delete come from
    reading the code. The mainline driver does not run my BCM43684 (it needs
    the BCA host interface), so this version is compile-tested only. In my
    tree, on a BCM43684 access point and with the delete sent without
    waiting, as in Andre's series, the host saw every tx status before the
    delete response in normal operation. The reused flowid case only showed
    when I held back the tx status of a flowring being deleted for 3 s in
    the driver: with the generation check, all 531 such statuses left the
    counter of the new flowring alone, and it matched the frames still out
    at each of the 15 deletes; with the check turned off, it was wrong at 14
    of the 15 deletes, by 787 frames in total, and went below zero.

 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 5ad46d7ec..f0c3c26fe 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -248,6 +248,7 @@ struct brcmf_msgbuf {
 	struct brcmf_commonring **commonrings;
 	struct brcmf_commonring **flowrings;
 	dma_addr_t *flowring_dma_handle;
+	u16 *flowring_gen;
 
 	u16 max_flowrings;
 	u16 max_submissionrings;
@@ -294,6 +295,7 @@ struct brcmf_msgbuf {
 struct brcmf_msgbuf_pktid {
 	atomic_t  allocated;
 	u16 data_offset;
+	u16 gen;	/* tx: flowring_gen of its flowid when posted */
 	struct sk_buff *skb;
 	dma_addr_t physaddr;
 };
@@ -560,6 +562,22 @@ static void brcmf_msgbuf_rxreorder(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 }
 
+/*
+ * Called when a flowid is released. A tx status can still come for a packet
+ * of the old flowring after that: brcmf_msgbuf_delete_flowring() sends the
+ * delete with packets still out when its wait times out, and
+ * brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
+ * control complete ring, so it can see a delete response before a tx status
+ * the firmware wrote first. The flowid may have gone to a new flowring by
+ * then, and the status must not decrement the outstanding_tx of the new one.
+ */
+static void brcmf_msgbuf_flowring_next_gen(struct brcmf_msgbuf *msgbuf,
+					   u16 flowid)
+{
+	WRITE_ONCE(msgbuf->flowring_gen[flowid],
+		   msgbuf->flowring_gen[flowid] + 1);
+}
+
 static void
 brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 {
@@ -567,6 +585,7 @@ brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 	void *dma_buf;
 
 	brcmf_dbg(MSGBUF, "Removing flowring %d\n", flowid);
+	brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 
 	dma_sz = BRCMF_H2D_TXFLOWRING_MAX_ITEM * BRCMF_H2D_TXFLOWRING_ITEMSIZE;
 	dma_buf = msgbuf->flowrings[flowid]->buf_addr;
@@ -645,6 +664,7 @@ brcmf_msgbuf_flowring_create_worker(struct brcmf_msgbuf *msgbuf,
 	brcmf_commonring_config(msgbuf->flowrings[flowid],
 				BRCMF_H2D_TXFLOWRING_MAX_ITEM,
 				BRCMF_H2D_TXFLOWRING_ITEMSIZE, dma_buf);
+	atomic_set(&msgbuf->flowrings[flowid]->outstanding_tx, 0);
 
 	commonring = msgbuf->commonrings[BRCMF_H2D_MSGRING_CONTROL_SUBMIT];
 	brcmf_commonring_lock(commonring);
@@ -768,6 +788,8 @@ static void brcmf_msgbuf_txflow(struct brcmf_msgbuf *msgbuf, u16 flowid)
 			bphy_err(drvr, "No PKTID available !!\n");
 			break;
 		}
+		msgbuf->tx_pktids->array[pktid].gen =
+			READ_ONCE(msgbuf->flowring_gen[flowid]);
 		ret_ptr = brcmf_commonring_reserve_for_write(commonring);
 		if (!ret_ptr) {
 			brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
@@ -920,10 +942,13 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 	struct sk_buff *skb;
 	u16 flow_ring_id;
 	u16 flowid;
+	u16 gen = 0;
 
 	tx_status = (struct msgbuf_tx_status *)buf;
 	idx = le32_to_cpu(tx_status->msg.request_id) - 1;
 	flow_ring_id = le16_to_cpu(tx_status->compl_hdr.flow_ring_id);
+	if (idx < msgbuf->tx_pktids->array_size)
+		gen = msgbuf->tx_pktids->array[idx].gen;
 	skb = brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
 				     msgbuf->tx_pktids, idx);
 	if (!skb)
@@ -937,7 +962,9 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 
 	set_bit(flowid, msgbuf->txstatus_done_map);
 	commonring = msgbuf->flowrings[flowid];
-	atomic_dec(&commonring->outstanding_tx);
+	/* not for a packet of a flowring that had the flowid before */
+	if (gen == READ_ONCE(msgbuf->flowring_gen[flowid]))
+		atomic_dec(&commonring->outstanding_tx);
 
 	brcmf_txfinalize(brcmf_get_ifp(msgbuf->drvr, tx_status->msg.ifidx),
 			 skb, true);
@@ -1325,6 +1352,7 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 
 	if (status) {
 		bphy_err(drvr, "Flowring deletion failed, code %d\n", status);
+		brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 		brcmf_flowring_delete(msgbuf->flow, flowid);
 		return;
 	}
@@ -1684,6 +1712,10 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 			     msgbuf->max_flowrings);
 	if (!msgbuf->flowring_dma_handle)
 		goto fail;
+	msgbuf->flowring_gen = kzalloc_objs(*msgbuf->flowring_gen,
+					    msgbuf->max_flowrings);
+	if (!msgbuf->flowring_gen)
+		goto fail;
 
 	msgbuf->rx_dataoffset = if_msgbuf->rx_dataoffset;
 	msgbuf->max_rxbufpost = if_msgbuf->max_rxbufpost;
@@ -1735,6 +1767,7 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 		kfree(msgbuf->txstatus_done_map);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		if (msgbuf->ioctbuf)
 			dma_free_coherent(drvr->bus_if->dev,
 					  BRCMF_TX_IOCTL_MAX_MSG_SIZE,
@@ -1775,6 +1808,7 @@ void brcmf_proto_msgbuf_detach(struct brcmf_pub *drvr)
 				  msgbuf->ioctbuf, msgbuf->ioctbuf_handle);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		kfree(msgbuf);
 		drvr->proto->pd = NULL;
 	}

base-commit: 5dbf2415ca9821a611d09308e3b29d2c37e7cd77
-- 
2.56.0

