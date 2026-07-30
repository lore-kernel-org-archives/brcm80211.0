Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428293321B1
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428503; cv=none; b=PUsvhqo8XUcaR9i4VebtlSSapiGgatVJ3w0cGHzxdTXo7sXeMgfulGwHRXzuEWxpsExJjPwIfaNFtLMQXe+Dbjc8V4kyBKhAPIzYlwZqWhBLbt2+PpmQ8KZel37Bmz3QS2xu9vpLffv3yGardAye4ChzrWqa4DnOqoaGjPiXOHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428503; c=relaxed/simple;
	bh=bq4PN7BDO0yFKVQsaXHpuXUbJYEn7r0/aMV4I2Qy7bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KrnM6BnOHy+sZffbkqa2MwMSRLIhJ1Q2FUqOVnQatffkkMayDtciLCli87Wrpt/LudxOv//2T0xp2ibNGC/qUHCT6p+qGtMxui3fkbf1dVxWgYVtciDrLmPPZVMxmzz57UMqIg7+2n7HziwKZRatZL7xt3L2m4QNw8SSPvlNXPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJ3kZmBD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ3kZmBD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so8733a91.2
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428502; x=1786033302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fDjKwH/pLgq11MmSt15oZfyeN0eo31ydS4Xhih3a270=;
        b=fJ3kZmBDInnTMb+ZDAk7VgO9grhnMiBtznSwMt5UR4MKq4yMKMJnoK/FPw73A3Y3if
         9jbB6CmjOrEqP9+rnM/SsmXOoKQmiFxfeGC/9bWB0h965o9KF0oBE/2SYgDGvwLVkZJp
         xSkZBFO3SE8ruWLCt4a/g77AJMyKKJSou5Lt8ksk6xHfzhPkFySWZdFZrTbDzdRX/F2s
         cud2vnu2Oky8alt7U1m9H8qOR7zIu+aJvdRsxhhietnxjfNEY10b/44lbNEBMQEzR/Uz
         FdYGx9CCH00A/+cvMlFVx+kUq+Bnn4K3lK1d31768mEUZhTlEuzblpMlRwza+WhQQo+g
         gAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428502; x=1786033302;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fDjKwH/pLgq11MmSt15oZfyeN0eo31ydS4Xhih3a270=;
        b=WDNjFEV6wxy6i02yehMEX3H8KHXzMnl80APSNkz2qaAtnedFYuj/AdD4458w6NPOym
         ImGaZhVzHKksneOpCj6kOBb1diliFQ57qjvB90E99GwQqZLgqOtcDuzanliyQhYJvkXr
         NaeJZwfSoryWINfuA4Kwq6+0zrTwp1zyE4onB6Y03fSXby8/9lZq5dH96G/4d1pn2NN3
         GocWQ2vDqhLTtMUuN9aHeDe131baJ8Yw2OyImkdk/ADJryw3N+JtaUrVi3AezApImOXP
         sCMk18eiwVUtxf2MHzjKMzCbI1q28WjHvdI+8gp0kHQ8LhMa6BrX1Rpp3g4WPLBx6tZU
         9t0A==
X-Forwarded-Encrypted: i=1; AHgh+Ro4Ix+jIYyEyFGZPG83e7jGsftSUdqR+R4Uyvo569X9BGdgAGx0/YxllF1zLuhCojTpLuaO3VBA0AU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwQ93ldDMf3J+zGAMhFw6HFPm0AbpkebY+IL0fR256bbrU7Q5w
	nFVXrFKP7Tjk9tuf+uL4cMbDAWp5VKvGheSlgADprp/8p/fQUsn7Zzpz
X-Gm-Gg: AR+sD11lFR4MWOBBRggzp+kYFEwmUNvNRTjVe4lHF9Z47xnCvz87REN4qtLhTEBTKeG
	CX5WjzU7S7u76JrcSlPHB1qFybyha8sjDcvgQrQM77vOj6RI3GQ3O65WNygRx0d/aGOqLpDX17U
	lYlH3Gbfp5cFHjM22CSu6yDL8NekNubSEmh8zW5fRbOqTCdndPEkiyXLM68CynTfN8y01p1tKqb
	5R5K3NijYqX64nYWp6izCwnM2rN4F9w9iB+Woa1HpMV/+nFkDtryBBOPrbLDdcQ2oj8zGEtyt/Z
	CqHByAalSt76pIg8Pi8OlPmwJz3HwY6mZj9PUC5XPo2tjIyvryu3UgBkE+ALm1oaIQROa4TFUDK
	DChvkutio4qcgJ8b/+aZURhA3ZsptkJqCdYe6TbUJrsT7ByeJzN75+xXwK4FnGcHCoHBSwUMAhG
	QshMpnvoILQ8xnYM21CPNcEuF/pHT7qkF5x8nR49S5sqYHsccjWxJ5CI/z+GWsMe1/bxHdsX1Pl
	nI=
X-Received: by 2002:a17:90b:4487:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-38fa8094a00mr759768a91.2.1785428501521;
        Thu, 30 Jul 2026 09:21:41 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:21:41 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 1/8] wifi: brcmfmac: flowring: replace O(N) loop with atomic counter
Date: Thu, 30 Jul 2026 16:21:04 +0000
Message-ID: <20260730162135.12278-1-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
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

