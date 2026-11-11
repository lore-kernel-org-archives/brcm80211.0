Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426973;
	b=FyJzCw8oXeH4AkUay8Ag28doM3zcCzXmUbd7RJn8DR97dT7Iwf+tp/qUpYt9EFnCC5dq
	 M3rYqH/gb80so4ofn1+bodkLLN8U0NU+5ud32JNL1ec9orUlma0k5BvOcpJqqdlGaERex
	 0rlDiymkTIUvKKr62b0J3QLhrhf6KPVDZkTIAen7UMqnuNE0dW75mH1sR0aw+xxYg0QRW
	 zRnR/YcuUnrJe1YKYtOEDY5TFqM9Mo4heiuaMau7kQRbA5QAVaoyrormkpof+xz364MBm
	 6rhS7Mb1r8h4lwz28R2PoalkIiQVf0fRAlhgfSRa575CHJWNGjChQDbJzgmIgxDgaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
	b=cOb3k47N57Lrh2sNx/G+V+/cPEyo9wlZNtvtK+uqFPbG6Bb6fRY5m7RF1NKj+gctYy4w
	 XOkpJycXitsx9UmFI/UciB1wbgA5jF8BsaoBVAJ1UoAPIPziSeqiKNUwlEmB4MBJzpvNb
	 J85mrkgZSz0aBjGkqoA+ck+1wUZ5AtGJkCzZsZzUxvQkYZJOqRAi34pe+YEojIS3Jlyka
	 ZTm6P5bIYilq//JnkudV1xsP87QukrswdGfG0Nd30jsu5CdKibAgyngnNtwNIIqa2TQYw
	 BloPjgH5QY1Nvtll8MdknnI9UPCZGx/z/6It0ijZWEm6MZsTOaWV/ZclbUbhHCZpa6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdU4hGgX;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076BD606A8AB
	for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 19:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076BD606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DdU4hGgX
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so549755366b.2
        for <brcm80211@lists.linux.dev>; Wed, 11 Nov 2026 11:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794426971; x=1795031771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
        b=DdU4hGgX1I50tpkpkOffqAr2rh1ivcD4paXaZqOD+D2pBUP/jTVHnfShFxM27eg4XV
         /qD8v5CWSP7H3QLIPdTj6eCk1FIM41xVqeCM57sBLLIQQUE82uyCJeXHv8eEJI+q2N8p
         EgY4aZ81e52ZOPMJGdfSDRmCwA/d8Brs1KHzqFY97Kv3Mha9J4zXkC9cRDlUzbXFFHHD
         f6kmC2E7cAFpNiLRdYnXOibdPd/Yi47bg+L7+O7QwvM/xj8p2ECZ44KiaEoLiGW98k4p
         2uf8P8pdsxOp+wFDvu5GwJbDvweMZjR7k4jd7wnOn8c8+rTxAddnuM++TDs9MDHC3aTn
         ErNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794426971; x=1795031771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KW38EDguzPKmx8VkeacRZuMXAWaeadLZ5kGyBS7By/A=;
        b=2j6BQFxwSmYaDutbkvgnN67GrPMyE4Th6gqy7zU6uqEETs/o2IJQG3ysJliWDd/8M9
         Do5J8QW1hSTOG1QqCgI5VK2IluyDnwe7KX4ByxlOBeLnwsLTDXJjYWfkZA3zVmOJrlHh
         5GPvw8viRRhqN9PRVpHWiDbpkh34sA4OHkebeP1ew3VOgD9acaq0+h/5s7CyA7ody6vO
         mhHaV3DjEYXc7SrNhOloMo+GexmOuW+ErgzSHsGvU0oaafQ+5sNaIIscHYSo5T0kw9s6
         BHroyzjzBZ26Cc56WLUz34DdavhQkPs19Pql2wq+bF9rO5HqevSiwXDF2lxtZzcH0daX
         UytQ==
X-Forwarded-Encrypted: i=1; AL+hErGH4mtJLikiFO3Xmrw64f1Za6exguQMO4VZ5wlVEgaT4JvVZaiBrGkYA9zUsnUkcFan+lW+yn7vrzk=@lists.linux.dev
X-Gm-Message-State: APuU4Z9007C7G5DwMZhIC7MfeJcD0XAgfjDjt+39DTU6OPsJZErP2com
	c5TsNUA7HVeUcQC/DKFhv6v4mqXy6U9P8SIPKtWOYfQdArc7DhCmYCrr
X-Gm-Gg: AYBFou1EUEPQDjSZjFdUyIKhMfh+b+5jBKZFOXJuK+tewRTsNbLgWepvYQU6hYHp6v1
	ps6Nc7xqCUQ81P5e0KU7QYQ4DYnnJDBwydBBv+/++4ugY9MiY5XPA5JeNeRbiJDAhnc2aVYQJHD
	MimZWDKCun5aGITC8c0dGaxwzVx3w/gzY2EVAl46cOQXQ8EtBVmrDq6T6WzYGOPMqLdI/1mDq0j
	osDA0n8QetDy6pXND7PT+VONOGppBffQB/Mc0CUAcg61u3NjU5cVUxFPLOWQjh4WUAeybJHdytJ
	9VaZZqHkD0k1wRSsupDF0BvNK27TJ1HCA6YkAzjUX5Rs6aroQ9gPcwZBlhOgUc4YEKwYDss6HhE
	mg1ebH4sZpOL1jrHbTZ2mAYKQ0x5ZgTKmwsH6NSK6YfcA3wHgsHtRPjst+1ooXIzTyWVZAE32X+
	fCrl/W5ioVl1jnLcEr3vTkdqcJ7nzIyYO3DtsVwkSiXJZRFG0LQjOaI3GYtTp9ulY4uU5k/dbpc
	x5b26EEFQsBBAH880wgYtgI7gF6QztnBf6LiZpN99J4oTzBHNYHvIrHQvvoQ1MfRsAcsGRbneaf
	VSVZlNyH4Jes+GLRFfxVaDliLVpw0CX0N5lRq2tB5ZAd3wFB3/m4fzJ0s4Xycjw5KPo4H8Re37N
	v
X-Received: by 2002:a17:907:8dc9:b0:c29:f5d8:9c82 with SMTP id a640c23a62f3a-c5066cf9644mr299944166b.49.1794426971015;
        Wed, 11 Nov 2026 11:56:11 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a57085fsm264408166b.22.2026.11.11.11.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:56:10 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Wed, 11 Nov 2026 20:55:59 +0100
Message-ID: <20261111195559.160650-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111200714.7897345f@kait2en-mbp15-1>
References: <20261111200714.7897345f@kait2en-mbp15-1>
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

brcmf_proto_msgbuf_rx_trigger() reads the tx complete ring before the
control complete ring. When the firmware writes the tx status of a packet
shortly before the delete response of its flowring, the host can see the
response in one pass and the status only in the next one, after
brcmf_msgbuf_remove_flowring() has released the flowid. If a new flowring
got the flowid in the meantime, the status decrements its outstanding_tx,
which brcmf_msgbuf_schedule_txdata() and the trickle check in
brcmf_proto_msgbuf_rx_trigger() rely on. This happens whatever order the
firmware sends the two messages in.

Give each flowid a generation that goes up when the flowid is released,
and keep it in the tx pktid of every packet posted to the flowring. A tx
status of an older generation still releases its packet, but no longer
touches the counter.

Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---

Notes:
    Hi Andre,
    
    thanks for checking the trace. Here is the patch, on top of your
    [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
    https://lore.kernel.org/all/20261107154810.89780-5-dev@deq.rocks/
    
    The generation goes up when the flowid is released, not when the delete
    is sent, so the debug message in your patch still counts the tx status
    that comes before the response. My tree for a BCM43684 access point
    bumps it when the delete is sent; this version is compile-tested only.
    Feel free to take it into the next version of your series.

 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 34 ++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index 8fd970571..9d8360d3e 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -247,6 +247,7 @@ struct brcmf_msgbuf {
 	struct brcmf_commonring **commonrings;
 	struct brcmf_commonring **flowrings;
 	dma_addr_t *flowring_dma_handle;
+	u16 *flowring_gen;
 
 	u16 max_flowrings;
 	u16 max_submissionrings;
@@ -293,6 +294,7 @@ struct brcmf_msgbuf {
 struct brcmf_msgbuf_pktid {
 	atomic_t  allocated;
 	u16 data_offset;
+	u16 gen;	/* tx: flowring_gen of its flowid when posted */
 	struct sk_buff *skb;
 	dma_addr_t physaddr;
 };
@@ -559,6 +561,21 @@ static void brcmf_msgbuf_rxreorder(struct brcmf_if *ifp, struct sk_buff *skb)
 {
 }
 
+/*
+ * Called when a flowid is released. A tx status can still come for a packet
+ * of the old flowring after that: brcmf_proto_msgbuf_rx_trigger() reads the
+ * tx complete ring before the control complete ring, so it can see a delete
+ * response before a tx status the firmware wrote first. The flowid may have
+ * gone to a new flowring by then, and the status must not decrement the
+ * outstanding_tx of the new one.
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
@@ -566,6 +583,7 @@ brcmf_msgbuf_remove_flowring(struct brcmf_msgbuf *msgbuf, u16 flowid)
 	void *dma_buf;
 
 	brcmf_dbg(MSGBUF, "Removing flowring %d\n", flowid);
+	brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 
 	dma_sz = BRCMF_H2D_TXFLOWRING_MAX_ITEM * BRCMF_H2D_TXFLOWRING_ITEMSIZE;
 	dma_buf = msgbuf->flowrings[flowid]->buf_addr;
@@ -768,6 +786,8 @@ static void brcmf_msgbuf_txflow(struct brcmf_msgbuf *msgbuf, u16 flowid)
 			bphy_err(drvr, "No PKTID available !!\n");
 			break;
 		}
+		msgbuf->tx_pktids->array[pktid].gen =
+			READ_ONCE(msgbuf->flowring_gen[flowid]);
 		ret_ptr = brcmf_commonring_reserve_for_write(commonring);
 		if (!ret_ptr) {
 			brcmf_msgbuf_get_pktid(msgbuf->drvr->bus_if->dev,
@@ -920,10 +940,13 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
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
@@ -937,7 +960,9 @@ brcmf_msgbuf_process_txstatus(struct brcmf_msgbuf *msgbuf, void *buf)
 
 	set_bit(flowid, msgbuf->txstatus_done_map);
 	commonring = msgbuf->flowrings[flowid];
-	atomic_dec(&commonring->outstanding_tx);
+	/* not for a packet of a flowring that had the flowid before */
+	if (gen == READ_ONCE(msgbuf->flowring_gen[flowid]))
+		atomic_dec(&commonring->outstanding_tx);
 
 	brcmf_txfinalize(brcmf_get_ifp(msgbuf->drvr, tx_status->msg.ifidx),
 			 skb, true);
@@ -1325,6 +1350,7 @@ brcmf_msgbuf_process_flow_ring_delete_response(struct brcmf_msgbuf *msgbuf,
 
 	if (status) {
 		bphy_err(drvr, "Flowring deletion failed, code %d\n", status);
+		brcmf_msgbuf_flowring_next_gen(msgbuf, flowid);
 		brcmf_flowring_delete(msgbuf->flow, flowid);
 		return;
 	}
@@ -1681,6 +1707,10 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 			     msgbuf->max_flowrings);
 	if (!msgbuf->flowring_dma_handle)
 		goto fail;
+	msgbuf->flowring_gen = kzalloc_objs(*msgbuf->flowring_gen,
+					    msgbuf->max_flowrings);
+	if (!msgbuf->flowring_gen)
+		goto fail;
 
 	msgbuf->rx_dataoffset = if_msgbuf->rx_dataoffset;
 	msgbuf->max_rxbufpost = if_msgbuf->max_rxbufpost;
@@ -1732,6 +1762,7 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 		kfree(msgbuf->txstatus_done_map);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		if (msgbuf->ioctbuf)
 			dma_free_coherent(drvr->bus_if->dev,
 					  BRCMF_TX_IOCTL_MAX_MSG_SIZE,
@@ -1772,6 +1803,7 @@ void brcmf_proto_msgbuf_detach(struct brcmf_pub *drvr)
 				  msgbuf->ioctbuf, msgbuf->ioctbuf_handle);
 		brcmf_msgbuf_release_pktids(msgbuf);
 		kfree(msgbuf->flowring_dma_handle);
+		kfree(msgbuf->flowring_gen);
 		kfree(msgbuf);
 		drvr->proto->pd = NULL;
 	}
-- 
2.56.0

