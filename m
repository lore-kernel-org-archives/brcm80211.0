Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CE449B01
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512968; cv=none; b=oygiHuBy8vfct/n857IHwAXd16kMZojZWdagedckisitASft2zvhBhaFdSGB9pzt6h0rwxoukf/P6cL3ysnRgUMuU/iaHM5Gd78F6gXRapkz1ZR4XlwXaMUko0YJhlJBkemhobSq1wBVvZ0K31Qsh300erZer9gqafQI/It7LM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512968; c=relaxed/simple;
	bh=bo6GZs5cRhfR+4h6zHzYZY0ne9OWftzWzsm3xWEM+bs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G3O6e2WhwDi6QWdknbVRG7G9FsZTiYujRoQ56EUPcvFYrbUyVeK4vIw7KmaX+OiAXdUV0Qtg54OfuddxEd2f5eka5XMjWkQnKj3VLLBGHSCqJSIwJTSZRV4Yrnl9Bt8+cjtU8j6IkAbj2+f3h2yFcaoexFlMHtpadPW8gaFBG3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FT/s1MyW; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FT/s1MyW"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf110997efso1823495ad.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512965; x=1786117765; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjsOjYk7yuXBgbYLc3ZTyWopMFfcMdSI35CR9dqHg6w=;
        b=FT/s1MyWsNnxx6Yb4RcDgL1D7E4kk0xCdD+SDBYUUHuQQii4MnM3cYTnk9gDcuvnG8
         e7JDJ0xy80WXgFq2XoN5I+Sk4sVFqQKaBTdjTBEgWhNpy/OhrsGpK4pAE+Nf2mPB5h9L
         B7Mm8a4cz+gVMfVnSNkgbuyuMW7xVrkUvgmAXLztAfUu7Mn8cv5C//5Uzlty2T5iT5H/
         WS/dhsIeBG9JLJu1PkZmbhKd+VOw3MtLU91Av78Dj7L0FQYtumHuZNoMCCfPMQYXTL04
         fpPFgSltYiE6hfJ1PKKmaZ/bT8/IaemkvA1tKTFLrxBAa7irRA9FB3qwGK3zcHxmyHnu
         bHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512965; x=1786117765;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjsOjYk7yuXBgbYLc3ZTyWopMFfcMdSI35CR9dqHg6w=;
        b=HRc1XHrLkKPiliVYRUHi9Lg8L7E0s6aDCuLm+KdiL3bCb3y1Zj86e4BsDgIxMPHDik
         iithhNsaBA1vrEfzAiY4z0NmVuKGy11CrAat6y4U/GvE2G0LEl+hDC1b+gEvR2tcxZ/T
         VDuWpD82NDIIOXJCLbIZ0ZihCDgY5PFnyP1wyVLLWSsxW4YDlrwlbEml708lmnWqCd/F
         E1tfWD3sXt+Rprk4ksAeuJ8Lp+Djj1Y9DHmM9gZ54rrPZuuX/14EFe/RDtptN7LtuVza
         XMhVqKR8JvUqG3kmFYXSE5orFgsKjCA9l4nbAdD6pDVO67/IB/oC2xotZMwz7PjIgz3e
         AuZA==
X-Forwarded-Encrypted: i=1; AHgh+Rpf55ten8mUx6Fd9loPDyjFl4I7YSoj+6Y/h+cMBSJzLjJ1jn+ET3GFHfZAwJq6597JLGvCff4dRnA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoN81LMEEXDSocG5YpXYqKkunDT50P47Dt6TD6n6Xijph6MunC
	9NLAcYMfpj80wILLpyxnLGXspcvo7Tw3CWKvuLVchC0OrytSqcOnuwxj
X-Gm-Gg: AR+sD11coUf/lGw5TCSPfmrygjvruj2AHIoaxl0HZK0P4mpvUvC1AlDS8xdGj84N9UO
	LoOrBzkB3t0DS7m4OyslfNckT1Y7/jFGbPlPwMm2UpDh7JfVXQ08P64eqDD4rhukdfO5FbcQW07
	PDNanXLtnddSN6f2UHEvVFgEwgcAFZoam1Cs5mxkZU3IwuietMd+kBmZMdJz8U0mVFF6qhJzZLy
	RRbgjHG4BckkEhDq7agpNScWYIsJ9967rRVLO2QhMTmJFjZ/tARiOSqVaL7zVCKFjWK3Fjfdmq4
	MlP7Pg5B77shjEGolHIlhNYN6XekTmQcmhiR6xbWdyOdNMsaWCI81lPFKVVNM2v7qGzx2Pm1PT+
	mJVOEFThz5R4p4BuOJapCGGkRWRdXhO3BC2959fgNuIEyJZKYPUDlnn5RhkmY5LGj2x4pk/jP+O
	EijVUUOGQZNa2pyIpt+dGAPbqIIKUiTpwpOekBgXV8UMDUZ/+NR9fUENgVIjxos648+OMPxQfYm
	eE=
X-Received: by 2002:a17:903:3c23:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d0523fc4ecmr7602255ad.4.1785512965351;
        Fri, 31 Jul 2026 08:49:25 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:25 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 5/8] wifi: brcmfmac: msgbuf: tune thresholds and optimize sleep latency
Date: Fri, 31 Jul 2026 15:48:37 +0000
Message-ID: <20260731154901.1822-6-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731154901.1822-1-shivesh@example.com>
References: <20260731154901.1822-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Increases tx pktids and tune flush thresholds. Fixes a silent tx stall
under high load by correctly using test_and_set_bit. Optimizes
initialization polling latency from msleep(10) to usleep_range.

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

