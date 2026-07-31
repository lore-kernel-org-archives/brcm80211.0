Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D86445AE0
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 15:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512958; cv=none; b=ZxATCzinmm9x3G4wj/2fUwI/4fGFYmmVR6uNSKREUoz1W1Cx3EsHAIYOqTRtKVMxFJV8++ll632Zv/6XJpsdu1q1L2MTgB9K375kYk48Umv6j7Vq9hTLsbij41uAz6rUYKGgtIsoBdJKAwyJydKgLDyfQcWH2O+DmYkLfPy2JL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512958; c=relaxed/simple;
	bh=bq4PN7BDO0yFKVQsaXHpuXUbJYEn7r0/aMV4I2Qy7bk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=luk45IombCCn2FKW9BsVi4xgcXz9fvBbds23B3dreYwiqZ55Fxhb8hnlxUbrMtfRSgUAhbNY8/EZeXrhlAQpr4cPQTyeRIU8LSjsTyy36wtYYLZjzciRcjrGIy9z2f5/gBDZeZ/aIc5j2xGnmp00Slzx3olGykUmLbMlVqqoXpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxgGMkrK; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxgGMkrK"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-ca53979f8e8so99045a12.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 08:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785512954; x=1786117754; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fDjKwH/pLgq11MmSt15oZfyeN0eo31ydS4Xhih3a270=;
        b=SxgGMkrKZ+RYxi2IapmhsVvGeEim75cgQLNz3NQLLDJ4xaiNh3NlyRiCm7yZlhkKm7
         u1Zk4SohN3YzY4olTEjh+eOkBX1OGZCamlLJBoYa+wKp+skIgiuM+oXV+r4+w5wut13v
         sQFKWeB63YZ9sIwHIJT6Qx2O4ZuWVR5rjyY9AquD0b2cO7IMhWb36LM42ssmNWXKKSPw
         s0XRMzA2ZW3dXcM9E6COQQwPzlrk1KRsSyWhOdKnQIicdRtcHFbaYeZUvmNJmlVmKe0d
         TwskrCoov+n/UXN4EdI4Zq3ydPT9O7U9JzkDU15f1ZmtlSTqhF49RqDCr5sjJuuo5t4Y
         AglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512954; x=1786117754;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDjKwH/pLgq11MmSt15oZfyeN0eo31ydS4Xhih3a270=;
        b=PFryAAfLEx31WxP26NcTKKdr7Cr6eVCYbMbOASwMZpShUu/fONUwMDsHcU7QxbeSsS
         JsJOkJQF9wqfWvZmPunGcrO86Rhvige5qGpOFJ8oeizJgaN93CoU3uVlr7Z1ls8Y02AF
         9LL+3KoSJXqfKXntbIXnffc00GGy9aTbIrlrLGw3Zr1EWZjOUMrKCHiDUWlqWNsXemTI
         XrLK9CAGwSTJL7ZWJdFpGScJ/J9mEk2SryVey2GCSX9YLaGbup5IbVTHB8cYVAzlYcEt
         4NbKZl9efj6S/7T9U5rwHB1dRvdmlUaFcmcrn2ysgqgolsndsJxLEjLOfv9sKSkir1dz
         YUPA==
X-Forwarded-Encrypted: i=1; AHgh+RofvMIRTHEKlZ1wlFoPbj/kupC5wIWBpaQxqZlYG8xbZDrAS1oRH8OsUJts1H4nnP8cR0zDjdVfGkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfPS9icnMH+Gi93xZonOPyi+2B71jezWkCurhCAr0KEFTCeHi+
	t8a86t5ucq8e6QkCX7pG1qMuNvcoBZSf2gDR+iVY472V+7On/zgzoSRN
X-Gm-Gg: AR+sD11+UqYkL01YJAOJEb7nRiySoL1gY22tR4KT87yWGlOnfjahevzSufM3InYB1sW
	bw9FkJjDSEw4LaSVkad3VMvJ9zEfClsC7eutIUloV7K+nJ1riohlmYPjBvl85v0BLGG3qdGQMG2
	ZFdgvfhGjVOqnsZZKQXU8Bf+CTqC9dYABTHNieJrcMomDKe8dTUn7DrCsixKH9k6d/AXo7pIqUQ
	gwawBBHd01s1GPABYh6dUZ4E+e14kSpplcMnwJOs3fuwn31XsnFwBBK5AseKHHRy50ntHX1RY1f
	1v/NC9A/pz1SZ1zcWsqNL3VW5IRWpTXeBVKsbjlD/4V6hIej3QmkM121HK0+lMII8ljRSCIdn4O
	b0ji+Keb4fG40V9ASMylqrgpeHj5BtNe9dvAYFuXZVn+Gx1PzwXxJDbsYA5UchkQ2kbjrvRa5HX
	FGErhWB2XtSfUlEN0Ngd7GZ2+cUX3xrBBoGNAFu/kAJpNoq9tQvUR5PlqNnsBGJui2jIeUArn0+
	dA=
X-Received: by 2002:a17:90b:562e:b0:36d:b30b:14ed with SMTP id 98e67ed59e1d1-38fbc4ad251mr509727a91.2.1785512953864;
        Fri, 31 Jul 2026 08:49:13 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm11852510eec.19.2026.07.31.08.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:49:13 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v3 1/8] wifi: brcmfmac: flowring: replace O(N) loop with atomic counter
Date: Fri, 31 Jul 2026 15:48:33 +0000
Message-ID: <20260731154901.1822-2-shivesh@example.com>
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

Optimizes flowring deletion by tracking counter updates with a flag
instead of an O(N) spinlock walk, fixing a teardown leak.

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

