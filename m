Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3FA4499A4
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514018; cv=none; b=CQ8nEYLJej/PVSoSMlstOlgXZst5ob1TInhGCFLF1pXU/iM+j0iJR8q0qsIV91F2o2JGNitq80ThfZCGQm/Jc2Rog2i9v1rKw7n/9a7co2utnEhMetqSS8iSxgZFNxha3bMFZNIOAAV/t/6xMa5aEEgy3RxQn8oB/v6470C/mo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514018; c=relaxed/simple;
	bh=YJBvBZWvNxs18TqfUfA1hwadJeuDBfwNuagruUWmko0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WBWX1ZsTmLUAjOrV/Cu9429Wp4DfVxqHGRa3ZotNWKJnriDwg58pvLKXWDyBcViNj9glaz7Q2UU1vFw+MSndE1AIuJC+7C607CLPiBAqhs92/FDkQ/5XVrR1iUyNw1sATmZ2mT7GNQo3vXJOxkHFq30VihgH8Gcr1DR/1jfPz8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqYMgFxV; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqYMgFxV"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso57138a91.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514015; x=1786118815; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V+7zRa7zBwj/Mp97JNRaCsdKi8S7AHJm5zHHTJ/ZjEk=;
        b=DqYMgFxV7tdYkMmc9DVj7DGix6tk8N760Jqngnws/W3fW5zfm24BPTeXSEBC0njJ2y
         DIkQmbkHUmcHXlg+FD79EXB1CdjI/I0KGuWrnp0Ra70a92xtzMoFZaxG1jqIULuiht0r
         JFHGWqz8kNiv9Y+PeemaGThpJ3twB68qxUf3wUFD8cSsw++pasjW5xmEgPAl8FnkV8Z2
         K/rBxhFxzRPFd8CQCjlpVfAPEAjnG4ycRsq1DlH/v75IFibwxIkGS+Ob+2JNPDzXJYFD
         9P+sZseR4OXOR7UYSJ9SYsBgD2pYNGodXjiTXxD0Bxer8y3SUgcVljCFeGv/rLzCPi4z
         ARnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514015; x=1786118815;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V+7zRa7zBwj/Mp97JNRaCsdKi8S7AHJm5zHHTJ/ZjEk=;
        b=fjKBl/Yxbf97AiSt2pELjxFbvBVfGcmr46UkIhrp70ZpbE27P2RKbWi9veK3ExmYJB
         RHjh6PBidHjbZ5BhAk5FbXOPYBvWOZ1C5fwdfSHT5gh2hGKGHTDr3hNu4QtYfJNsG+VY
         JfRJgfbt0JODtiE1T1uzxmGHko9SgzG5FGukP6c8ssXH3Cv0IW+5lESw826lVdp7Wm5j
         NHDqsl4eFB8/qmWysv1jXxX3xisjq8dK9H6sEP42F8ya8etOLg48Buj2YxftnhxYGZDW
         AnuLcgvl4nL2SA81GW7dH6CIz8DxnYI/3E+hC+qUTJl/5qvmSTHEb4/MvORCbFTq9H90
         ZGtA==
X-Forwarded-Encrypted: i=1; AHgh+RpPqN6b8GeVzsz7AKc3wQXJJc5HGkPzgtwdEhNMPSr4P/E7Zhx0Ns9QyROOHtJrwvnTvak83Jdvc3k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlSNS2PluDzBF2dMs2vCEjtnbA/+rI45X4bgEKqMzyjSEOZwXd
	gd175w49US7pFwVkEblFZRjgt+Z89X9K9G880McuFwXBcnk2JwSV4i6g
X-Gm-Gg: AR+sD11Cmv8hJjC1L1zg1xg132fmUYdUfgmqnpBgS9y8uQmq+dcJeBcr4Y3GqxvYazX
	6TnNBbdHfaTJL7U98yXXf07yd7t9CwGV0pD/P/d6v/1Vu9FH/918F1ipGUf5scRAftutp0D7W+2
	u77Ym7ZHq/PNvySKfKRQ8AGROEcelTjVz+Qpcwmqxb+e05Bs2yWEEX0si3EIDbAEupYEE+MH8Q2
	+JgGGco2eulZoxr+SA2e1U7XYpeeH3zm8hWmTShCNPp0924gya/81rmKnOSJ/t3zRZ7cAIiCyn6
	Pi0ExtPg28iPBUK5pEpb3mY/8syJi1D4DK4ZZ1xQQD0iTBEAeK7N0PrUH32Bz6r8aI+fR7OeLE5
	ji6NLsTZLFfew3OBoYZY7M5oHp6reb0yJHxDpFR/SP9omLDcG7IUd6yRofpHS+uDbeNfT/SHaLb
	7qzO+IxOLNDs+xf8Bl2JfOUILGB/7rNwTiUTBBvYNQMW5jzM1vEFcv27+wqt6eR8Atp8hIWsOmZ
	RUAV4Cf
X-Received: by 2002:a17:90b:5408:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-38fbc4c8183mr624796a91.3.1785514014834;
        Fri, 31 Jul 2026 09:06:54 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:06:54 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 1/8] wifi: brcmfmac: flowring: replace O(N) blocked-ring scan with atomic counter
Date: Fri, 31 Jul 2026 16:06:18 +0000
Message-ID: <20260731160646.3812-2-chanelshivesh@gmail.com>
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

brcmf_flowring_block() previously determined whether any sibling ring
was already blocked by walking all nrofrings entries under block_lock.
This O(N) scan is both slow and incomplete: a ring that transitions
from RING_OPEN to RING_CLOSING while blocked causes the unblock path
to skip the decrement (because ring->status is no longer RING_OPEN),
leaking the implicit "someone is blocked" state and permanently
stopping the netif queue for that interface.

Replace the per-call O(N) walk with a per-interface atomic counter
if_blocked_cnt[BRCMF_MAX_IFS]. Introduce a per-ring boolean
counted_in_blocked that records whether the ring has been added to
the counter, so the matching decrement is always applied regardless
of the ring status at unblock time.

The decision to stop or wake the netif queue is now a simple
atomic_read() check, still performed under block_lock to prevent
races between concurrent brcmf_flowring_block() callers.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/flowring.c    | 65 ++++++++++++++-----
 .../broadcom/brcm80211/brcmfmac/flowring.h    | 18 +++++
 2 files changed, 66 insertions(+), 17 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
index 35cbcea0abc9..b9c518939f50 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
@@ -182,10 +182,8 @@ static void brcmf_flowring_block(struct brcmf_flowring *flow, u16 flowid,
 	struct brcmf_bus *bus_if;
 	struct brcmf_pub *drvr;
 	struct brcmf_if *ifp;
-	bool currently_blocked;
-	int i;
-	u8 ifidx;
 	unsigned long flags;
+	u8 ifidx;
 
 	spin_lock_irqsave(&flow->block_lock, flags);
 
@@ -194,23 +192,54 @@ static void brcmf_flowring_block(struct brcmf_flowring *flow, u16 flowid,
 		spin_unlock_irqrestore(&flow->block_lock, flags);
 		return;
 	}
-	ifidx = brcmf_flowring_ifidx_get(flow, flowid);
 
-	currently_blocked = false;
-	for (i = 0; i < flow->nrofrings; i++) {
-		if ((flow->rings[i]) && (i != flowid)) {
-			ring = flow->rings[i];
-			if ((ring->status == RING_OPEN) &&
-			    (brcmf_flowring_ifidx_get(flow, i) == ifidx)) {
-				if (ring->blocked) {
-					currently_blocked = true;
-					break;
-				}
-			}
+	ifidx = brcmf_flowring_ifidx_get(flow, flowid);
+	ring->blocked = blocked;
+
+	/*
+	 * Maintain the per-interface blocked-ring counter.
+	 *
+	 * We use ring->counted_in_blocked rather than checking
+	 * ring->status here.  A ring that became blocked while
+	 * RING_OPEN has already been counted (counted_in_blocked=true).
+	 * By the time we unblock it during teardown its status may have
+	 * advanced to RING_CLOSING, so testing RING_OPEN would wrongly
+	 * skip the atomic_dec and permanently leak the counter, leaving
+	 * the netif queue stopped forever.
+	 *
+	 * Rule:
+	 *   block transition  (unblocked→blocked): count only if RING_OPEN,
+	 *                                          set counted_in_blocked.
+	 *   unblock transition (blocked→unblocked): decrement only if we
+	 *                                          previously counted it,
+	 *                                          clear counted_in_blocked.
+	 */
+	if (blocked) {
+		if (ring->status == RING_OPEN) {
+			atomic_inc(&flow->if_blocked_cnt[ifidx]);
+			ring->counted_in_blocked = true;
 		}
+	} else {
+		if (ring->counted_in_blocked) {
+			atomic_dec(&flow->if_blocked_cnt[ifidx]);
+			ring->counted_in_blocked = false;
+		}
+	}
+
+	/*
+	 * Only propagate a netif queue-stop/wake when the interface
+	 * transitions between fully-clear and at-least-one-blocked.
+	 * Reading the atomic is safe here: we hold block_lock, so no
+	 * concurrent brcmf_flowring_block() call can race the update
+	 * we just made above.
+	 */
+	if (blocked && atomic_read(&flow->if_blocked_cnt[ifidx]) != 1) {
+		/* Another ring was already blocked; no new queue-stop needed. */
+		spin_unlock_irqrestore(&flow->block_lock, flags);
+		return;
 	}
-	flow->rings[flowid]->blocked = blocked;
-	if (currently_blocked) {
+	if (!blocked && atomic_read(&flow->if_blocked_cnt[ifidx]) != 0) {
+		/* More rings still blocked; do not wake the queue yet. */
 		spin_unlock_irqrestore(&flow->block_lock, flags);
 		return;
 	}
@@ -367,6 +396,8 @@ struct brcmf_flowring *brcmf_flowring_attach(struct device *dev, u16 nrofrings)
 		spin_lock_init(&flow->block_lock);
 		for (i = 0; i < ARRAY_SIZE(flow->addr_mode); i++)
 			flow->addr_mode[i] = ADDR_INDIRECT;
+		for (i = 0; i < ARRAY_SIZE(flow->if_blocked_cnt); i++)
+			atomic_set(&flow->if_blocked_cnt[i], 0);
 		for (i = 0; i < ARRAY_SIZE(flow->hash); i++)
 			flow->hash[i].ifidx = BRCMF_FLOWRING_INVALID_IFIDX;
 	}
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
index f3d511f9a3c9..afdea8b3f8aa 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
@@ -5,6 +5,8 @@
 #ifndef BRCMFMAC_FLOWRING_H
 #define BRCMFMAC_FLOWRING_H
 
+#include <linux/atomic.h>
+
 
 #define BRCMF_FLOWRING_HASHSIZE		512		/* has to be 2^x */
 #define BRCMF_FLOWRING_INVALID_ID	0xFFFFFFFF
@@ -26,6 +28,16 @@ enum ring_status {
 struct brcmf_flowring_ring {
 	u16 hash_id;
 	bool blocked;
+	/*
+	 * True when this ring has been counted in the per-interface
+	 * if_blocked_cnt[].  Set to true whenever the ring transitions
+	 * unblocked→blocked while RING_OPEN; cleared on the matching
+	 * blocked→unblocked transition.  Needed so that a ring that
+	 * becomes blocked while RING_OPEN and is later moved to
+	 * RING_CLOSING still correctly decrements the counter at
+	 * teardown, even though its status is no longer RING_OPEN.
+	 */
+	bool counted_in_blocked;
 	enum ring_status status;
 	struct sk_buff_head skblist;
 };
@@ -40,6 +52,12 @@ struct brcmf_flowring {
 	struct brcmf_flowring_hash hash[BRCMF_FLOWRING_HASHSIZE];
 	spinlock_t block_lock;
 	enum proto_addr_mode addr_mode[BRCMF_MAX_IFS];
+	/* Per-interface count of currently blocked open rings.
+	 * Maintained atomically so brcmf_flowring_block() can check
+	 * whether any sibling ring is already blocked in O(1) without
+	 * holding block_lock across an O(nrofrings) walk.
+	 */
+	atomic_t if_blocked_cnt[BRCMF_MAX_IFS];
 	u16 nrofrings;
 	bool tdls_active;
 	struct brcmf_flowring_tdls_entry *tdls_entry;
-- 
2.53.0

