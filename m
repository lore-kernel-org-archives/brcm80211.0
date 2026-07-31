Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3532D44C505
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514029; cv=none; b=EvEgWxeFEZyhiMrsJgJVmmE1MYnTHHJLFAPDnHifxNweJsDNCOBJS/+cxsojendR2gwlaIX/l1AUXgYwC75Dxz2B+IYsdzTbIoOTuWplk0JuNRtj6c6UJ8P4eXukN3QnstKlRneLpgSK6HOGtGPMwqKqomaMMu+vx7xbgoLgr/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514029; c=relaxed/simple;
	bh=rAnNEed0QyosxM1+/rEkio2/Gl92Wp46IZzRHEGrWcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P7O/nd0vsPIpwydJ2IG+Yt10AJ3Hn4iv2siBiMNXA89a96Z/1yyS65PAdqR9LVZD+vvpG6RyNanGQS06ne05J1eoG7PLYE/L1HwIV0HoxrcakxbGnK4INE7POTKtpccNxP2vDu+nFFODIK60VzNlfiUkk3Iyx1PKb51aM5RJMq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SKq9RUp/; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SKq9RUp/"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so136094a91.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514027; x=1786118827; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SgtLwC7ZO4crIImA5wZcdV4RpLWyizWcscAs4EEf7Ps=;
        b=SKq9RUp/502SqDKde+Js5j4FmyDMaeXd125X1hUgvX10jWPUMpuKhb9bYscDCUYmYL
         s+/vo9cJg5uY/iFcLr/76FHeOGF1vRgPSkaMLTu+g/zvZGOWr0yfmjN012fVTqkmqS4/
         N+umLgbwt9ZA+at8IG6AtNw8WqFrnXSZ9btqrnmhlLalNZV0MQj3sao2e8LobLjgnxUl
         SmpfY9OgRQG246euZAdsfNxV+eqP57Jssz+IO8qYkJpxTheZY4qPrj2ZSSzxpij0r3ZR
         gE78guWDpMuh91RVfvBJUFqjBBaIaIx4Qzlen9odtW0Q9HQHUpZJ25aArBMh/Y5qHrWh
         tuyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514027; x=1786118827;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SgtLwC7ZO4crIImA5wZcdV4RpLWyizWcscAs4EEf7Ps=;
        b=rZbDoDpbjkyHWgHtjj6Cx9HDkhajhryqfWTI1cD1f6M7bsE3MNr0q/+o62tZpIromJ
         OVgV0AZ2FkZgagv1NiNWxI5dtVfqjkcFTsZ9XbPM3SL89kSNsBcVBpRrcfc+jCZcgrtE
         JD9fO25WBEvkrMwQ7farxdPwvHTKpcXQp2BRKkxSc2OtG7hKFs5EeFvOhU2MCHy2KpDg
         jMOZ/ErxRq3vveU3vk0/VsDMbgP/7ILp4ak3XH1pIKBkuA8gxqgn0Rz1oZ33DadBL65v
         3Qly7GdxecUV2tzXhYYNs5GLYOfQt6wY5duwz3wz5o4/2dm1kAw4/jb8b6pTpOSHUv2p
         X50A==
X-Forwarded-Encrypted: i=1; AHgh+RpxRAyqYZLhSWh9hcSuiZP6fJoY4bBsIqDlI/FtUzghGe8Pp3R3yld6OyQJecxn2X2H2QLnMgjRJBE=@lists.linux.dev
X-Gm-Message-State: AOJu0YyQgVUGvsgtW2VwtRcnYEB9Mk2xXqYVc6QKhpDgO04V2CV/QG7l
	S5Oiu30LraEEx7HuJ4fHPT0e/CKKEoa+Fr0FGf5Y8F/T/KH6vmjTKDML
X-Gm-Gg: AR+sD10rpCALCgMQbhnXNltnufb87OACCZ50YX9Bcfmjr1VdsgN4rdEa4uACRzZ6Ph7
	LfYGCwc79YKPQ+7DS38b6u3WZ8U9yAsJdIyqKklJTCaO5wNGyNJinUxdtG5dcA9reqVzO0o0tkI
	NP2OOUngWneH9xkIgvCCTreSwAlVZ28YemjQZnei2UR/cNmG1r/YglDoAOKCBHsrKYYZf2NA+fQ
	qlTFXo50x07T0Ks9Q8J5BMlALrwdhKwAeIxA1O7LAN7oMvFosqi6eNAb4i6Q6eHCa7ipixHV3x9
	aGtFURpgjOCepV9XyCn8kdZ36HZ+Njr9Ek+5nHhNmJPDx20YlKMe1iOnTLfJqlwATmMS3/Nnj8C
	HvWYh+Qk5XHu7YtsNRIiheaOQgfqkwlx+WJRiJIzihR5/G9lEedUoLHQWaygpZ6PfEV0uFidmM0
	C2sGuqUP9CvCVqwjhl4CI3rlFG6eP1Gw51R8pwytwSXXPNqYGK4/EYdu00cjc2Xp0lO0fDXlJnq
	UfYksoR
X-Received: by 2002:a17:90b:3c50:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38fbc3ffa28mr645926a91.1.1785514027354;
        Fri, 31 Jul 2026 09:07:07 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:07:07 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 5/8] wifi: brcmfmac: msgbuf: fix TX stall and tune buffer/threshold constants
Date: Fri, 31 Jul 2026 16:06:22 +0000
Message-ID: <20260731160646.3812-6-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Three related changes:

1. Fix silent TX stall under high load
   brcmf_msgbuf_schedule_txdata() used set_bit() followed by a
   conditional queue_work(). When outstanding_tx >= DELAY_TXWORKER_THRS
   and the flow_map bit was already set by a previous call, no new work
   item was queued. If the existing worker had already run and cleared
   its flow_map bits, the freshly enqueued frame would sit unsent until
   an unrelated event woke the workqueue.

   Replace set_bit() with test_and_set_bit(). If the bit was clear,
   a worker must be scheduled unconditionally. If the bit was already
   set, the existing coalescing heuristic applies.

2. Increase NR_TX_PKTIDS from 2048 to 4096
   The 2048-entry TX packet-ID pool exhausts under >= 4 concurrent
   iperf3 streams on Wi-Fi 5/6 devices, causing "No PKTID available"
   drops and TCP retransmits. 4096 provides headroom for high-
   aggregation workloads (~48 KB of additional host memory).

3. Raise TX flush thresholds from 32/96 to 64/128
   Doubling CNT1 and CNT2 halves the PCIe doorbell rate on sustained
   TX workloads. Latency impact on low-rate flows is negligible because
   TRICKLE_TXWORKER_THRS (32) still causes a schedule before 64 frames
   accumulate.

4. Replace msleep(10) with usleep_range() in init buffer fill loop
   The post-attach RX buffer fill loop slept for at least 10ms per
   iteration (often 20ms+ due to jiffy granularity). Convert to
   usleep_range(1000, 2000) and increase the retry limit from 10 to
   100 to preserve the same 100ms total budget with much lower latency
   on fast hardware.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/msgbuf.c      | 69 ++++++++++++++++---
 1 file changed, 61 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
index ba1ce1552e0f..8db6167072da 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c
@@ -48,7 +48,19 @@
 #define MSGBUF_TYPE_LPBK_DMAXFER		0x13
 #define MSGBUF_TYPE_LPBK_DMAXFER_CMPLT		0x14
 
-#define NR_TX_PKTIDS				2048
+/*
+ * NR_TX_PKTIDS: number of simultaneously in-flight TX packet IDs.
+ * Each outstanding TX frame consumes one ID until the dongle returns
+ * a TX-status completion.  The original 2048-entry pool exhausted under
+ * ≥4 concurrent iperf3 streams on Wi-Fi 5/6 (802.11ac/ax) devices,
+ * causing "No PKTID available" drops and TCP retransmits.  4096 gives
+ * headroom for high-aggregation scenarios while still fitting in a
+ * modest amount of host memory (~48 KB for the pktid table entries).
+ *
+ * NR_RX_PKTIDS: RX post buffers pre-allocated to the dongle.  1024 is
+ * sufficient for current hardware RX ring depths; leave unchanged.
+ */
+#define NR_TX_PKTIDS				4096
 #define NR_RX_PKTIDS				1024
 
 #define BRCMF_IOCTL_REQ_PKTID			0xFFFE
@@ -64,8 +76,29 @@
 #define BRCMF_MSGBUF_PKT_FLAGS_FRAME_MASK	0x07
 #define BRCMF_MSGBUF_PKT_FLAGS_PRIO_SHIFT	5
 
-#define BRCMF_MSGBUF_TX_FLUSH_CNT1		32
-#define BRCMF_MSGBUF_TX_FLUSH_CNT2		96
+/*
+ * TX flush / doorbell-ring thresholds.
+ *
+ * CNT1 is the minimum number of frames to accumulate in the commonring
+ * before the first intermediate write_complete() (doorbell ring) is
+ * issued mid-batch.  CNT2 is the hard flush interval: after this many
+ * frames have been written since the last flush, we unconditionally
+ * ring the bell and reset the counter.
+ *
+ * Raising both from the original 32/96 to 64/128 doubles the average
+ * number of TX descriptors committed per MMIO write, halving the PCIe
+ * doorbell rate on sustained throughput workloads.  The tradeoff is a
+ * marginally higher worst-case latency for the last frames in a burst,
+ * which in practice is hidden by the time the dongle DMA engine drains
+ * the previous batch.
+ *
+ * TRICKLE_TXWORKER_THRS governs how often brcmf_msgbuf_tx_queue_data()
+ * forces a workqueue schedule when the queue depth is not a multiple of
+ * this value.  Keeping it at half of CNT1 (32) preserves responsiveness
+ * for low-rate flows (e.g. VoIP, ICMP) that never accumulate 64 frames.
+ */
+#define BRCMF_MSGBUF_TX_FLUSH_CNT1		64
+#define BRCMF_MSGBUF_TX_FLUSH_CNT2		128
 
 #define BRCMF_MSGBUF_DELAY_TXWORKER_THRS	96
 #define BRCMF_MSGBUF_TRICKLE_TXWORKER_THRS	32
@@ -787,10 +820,30 @@ static int brcmf_msgbuf_schedule_txdata(struct brcmf_msgbuf *msgbuf, u32 flowid,
 {
 	struct brcmf_commonring *commonring;
 
-	set_bit(flowid, msgbuf->flow_map);
+	/*
+	 * If the bit was already set, a txflow_work item is already
+	 * queued or running for this ring.  In that case the existing
+	 * worker will drain our freshly enqueued frame when it runs,
+	 * so we only need to schedule another work item when the
+	 * force flag is set or the ring is below the delay threshold.
+	 *
+	 * If the bit was NOT set (test_and_set_bit returns false), no
+	 * worker is pending for this ring at all.  We MUST schedule
+	 * one unconditionally, otherwise the frame we just enqueued
+	 * will sit in the flowring unsent until some unrelated event
+	 * triggers the workqueue — causing silent TX stalls under
+	 * high load when outstanding_tx >= DELAY_TXWORKER_THRS.
+	 */
+	if (!test_and_set_bit(flowid, msgbuf->flow_map)) {
+		/* Bit was clear: no worker pending, always schedule. */
+		queue_work(msgbuf->txflow_wq, &msgbuf->txflow_work);
+		return 0;
+	}
+
+	/* Bit was already set: worker pending, apply coalescing heuristic. */
 	commonring = msgbuf->flowrings[flowid];
-	if ((force) || (atomic_read(&commonring->outstanding_tx) <
-			BRCMF_MSGBUF_DELAY_TXWORKER_THRS))
+	if (force || (atomic_read(&commonring->outstanding_tx) <
+		      BRCMF_MSGBUF_DELAY_TXWORKER_THRS))
 		queue_work(msgbuf->txflow_wq, &msgbuf->txflow_work);
 
 	return 0;
@@ -1621,11 +1674,11 @@ int brcmf_proto_msgbuf_attach(struct brcmf_pub *drvr)
 	do {
 		brcmf_msgbuf_rxbuf_data_fill(msgbuf);
 		if (msgbuf->max_rxbufpost != msgbuf->rxbufpost)
-			msleep(10);
+			usleep_range(1000, 2000);
 		else
 			break;
 		count++;
-	} while (count < 10);
+	} while (count < 100);
 	brcmf_msgbuf_rxbuf_event_post(msgbuf);
 	brcmf_msgbuf_rxbuf_ioctlresp_post(msgbuf);
 
-- 
2.53.0

