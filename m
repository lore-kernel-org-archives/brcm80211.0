Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA62F463B99
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427486; cv=none; b=MpfmRbIIRZ2Ds/5jQVEZBi9QQHJJ36wceybolrWx/ydWYIDCsE79L/cLqSOKgdy44Zuep5USvtw2oWy5hu9RLO1TNYjdLr8aA5weicT83Jl4cgCrE0uSKCWgBtE+nwGMWDK1uueVW58Zxxg1dNX3/IFJSXHdA3FNtUxKnzjVtb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427486; c=relaxed/simple;
	bh=gkAnUCyYpehMzHmYIc25rVziVrhfkNOjur94Ob19X6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CQXYpi5HkXGUgVDKvFvzf1qAU7kcjmwIIWEIM9txHPYh5QKalLA2Cv5XccTvurr2sxeD9Hrlp7rN61ykt1NxdZaZwCmQtfolD57CD0HubBCYhqJB6GL8XoQUsqhKNKuG4WF6FAJijIOWjtcJWfH3fmfa23umGcPNmLtRW9Jf1eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIiJfGN3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIiJfGN3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so5193a91.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427484; x=1786032284; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjoI5FnOpAUf/hyrk7Qs3Ouzwtem6HJr54Hst1usiSo=;
        b=pIiJfGN35gs3VvmZDM1wkuDQJsIJelUkfFHyJ79JwFV2uaNj78YG4jVNK7C/I1tl48
         7/TyjaGpZ0Y1ZR9LKpkQZ1zhGS3i4TsOcknytdRtBltMcDNFWvIpzIy4HOzaJ7D/lKEP
         hV+ihW7Rb80BfRiRdI584JUbXAnTTg7XhjGww1KSTW+4O6nhCfupyeq+aZulCg+Dx4dp
         oTKRneUa86Go+KMK/wbP3zKheLmtANmXdrgtSoEX1uNA+ejYOjwNNOWweDjYRKwdc4wv
         KFjql42EkhyeAg08/Q29aNn5n9L2v5cp2WXyKzG/aC2adeTojJzV8H8B1ySJRg6rznqa
         UfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427484; x=1786032284;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjoI5FnOpAUf/hyrk7Qs3Ouzwtem6HJr54Hst1usiSo=;
        b=lnKCRIRwWkY4G+dhgU+Z+kePX+7KPNOtkGAox6zJeYeQWL3GeNzBJdvQI9Dud47ZDt
         2o518TrcL/+o/M3YLilxKk0/e23tauOxUfTuFe3wBNcB7/ZTjSe1G/ztZMr+qkrliBVw
         Mb/gY0wc72jyjK7wnvMligWmf35lKF3wyzueydftQQxReK6cOn2V0Lhk4e7OL8I++Ku7
         ONI8cRDnhVxj6FCENIhak7CCSe9a3EB+yt3QqReYsj8LtsBLuNQVOBfeWwLUl9if88zD
         ah4qzaFLgEbO6yxprmFXSYxaQ2dA1jAJMZL2rtqBw7+8LglRGK/urPXCoqUDWQERzajn
         SJoA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+0R6qv3Fps8k9HLD5acnqoCYtIBGxgth771DXrzpu+7V100qqCTZhpJLngwVsWTtIGO/4V+QxReo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNIWjHbqXAvGhSTC5gl04V7eSBB96+dTsXGSNbf7NkK8KlcGSz
	HgLEX4BVQH5w0lZYYbq5xgdQvh+QbiyB7pqvCx8BUXCp23s4G7N2iHcx
X-Gm-Gg: AR+sD10VIe44mj4a9z3wMdvmB9cHaJW+zxBhp9QuXSLhN7jy8FyyGnZO2D8ewn5WBGT
	bDg9jmuaVoBt1l3BuTvpQybvc+CXQqT+oNfYo3BNEyRxrTyAUSW3ZhQTw3hT+mnYwqPEh8KBs7B
	fB5NigopuPNVXQQ+XQebQBwUxWXp9O6IItLa5PP2pCvwKLAY4NORxZkJxbDjzbbzSqL5/Ym2OnX
	2vGFKdXhFCtHVBAFbbZYVUdaunZxuMZlryatQuhpVnKSm7nvqwH7Wir0RHyjudOb4ywDQejm7UF
	ISEd4Xj9R2f7ODVnIOKFQVcg59hDjc+309xOTW0vfQdTTiM+Y3bkIxhY9Om7vFidOgFdK3/hTE4
	QR1SbnyNl7XIpE0oqpn9zLB6nWdL3EZcitgdi/zGWOnJhSvaNtA53MPzMdYwzQ0Njr1PqqMUZPM
	QF04D1h1ZNbtRFWtTQuYmZ7hwl7JDSkqEd/sqOHjG8oWMt+dzY/XeHFjKKYXYU2KGFcsaxUYCDY
	gWpigMY9dpjyiHmmcuu2Mw62Q==
X-Received: by 2002:a17:90b:2dd0:b0:381:2788:a437 with SMTP id 98e67ed59e1d1-38fa7f2fc13mr879033a91.1.1785427484126;
        Thu, 30 Jul 2026 09:04:44 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:43 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 5/8] wifi: brcmfmac: msgbuf: tune thresholds and optimize sleep latency
Date: Thu, 30 Jul 2026 16:03:53 +0000
Message-ID: <20260730160425.11933-5-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Increases tx pktids and tune flush thresholds. Fixes a silent tx stall
under high load by correctly using test_and_set_bit. Optimizes
initialization polling latency from msleep(10) to usleep_range.

Signed-off-by: Shivesh <shivesh@example.com>
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

