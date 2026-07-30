Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFB44AB81
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427474; cv=none; b=jLxQa2gYbUmC3188xYuZswCEEtQ65uqpi1y6vTwAFYMyEn+F2nyfGyJKf8IvF/JyMLpC3B3ndwbWlLj2nCfNys5EHlyTNOXFIsGTTyj0YdPJXJk5588uUrBvmxMdJO+qUIoZjoFgBfe9rANFZO8H0Rk9RbAB3IcweWUpTlcSDdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427474; c=relaxed/simple;
	bh=OspfEu0PH4En6DDNaG81nLBxGMAEqO3gsvGoIDdgcn8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U18ut8mu5cpYHxJo9OXFPk+t2YxYEra5D0i6yEjbZcxWca3/DpmjGZfa+UMHcOj5y2DOJQZbAKsMjqyzZ2yuOPoeF09r6Tzd2sNM10wUL8m9u57d72dBeDRLviqgvS2guSQwDC2A2nMoYoppC6RtO6/iTIDKxnaE8utsD4Cmzl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ci7jEkbc; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ci7jEkbc"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so5176a91.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427472; x=1786032272; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hqASPZFtaBlHPhl3fozdspmc8s9/23tVm7H9FNuYtZU=;
        b=Ci7jEkbcqaDq1nUDMGwTr6SaUXmwqZ0K4moBRu7gJUQ7Yzo+LKBT9idF5L4nRZcsBc
         vRTelHCAYCR4uP0nQWFrIfWCPuDWU6lEipXJ+o5XuOSrxQBVSe7jGb/lAaaTjS9qMfri
         LJljOOJRCICcztCruvL/iwZGjUF90ByV3FlyC1/Ezp54ettQp+2kg4SaXPY4SQVg2kKo
         7Un/BucoYeduwh5/6e2tSmumDJRX5imW7CMvfwIxY/74+Xofrt7HN1s8WR+rciZ2F2Et
         W9prtK6KI03nEdwpG8bmuCro+SEmWSdNQcG2bpbtd+CKn6Tj6JQocLyS+0QUA7LSNho4
         kANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427472; x=1786032272;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hqASPZFtaBlHPhl3fozdspmc8s9/23tVm7H9FNuYtZU=;
        b=MigVwyYZH1bK30DzJrFve8c1oOFcRr9Yrv7Bat16kqtfdO4acbvhgImwv2O/8FSh2B
         tZYnqzZs5BNqorlWLLVsZP6GI34jXjZ0W+nZgN0hRn8UgcWH4lKiwAxvPR/U0UfIXVac
         shs2xKlxFjn7dBy4QL/1GosRujYUMkLED+vl/uJ4Ekpsrl39k1Ny/e0RnyIq5NyGs0zC
         NxnkyjxH/e285NBJG43ftILIOl0Il5PLQSbN5ReS7AmajVfY8JvgOrH0yla6CA6IpSfB
         zXTIdzfaClgoNWhYeJ8NoFHEgE9spCurB76Vf+nOKMQyj92E3Cf8N8mEuNHqJ5wl3T9t
         cV4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpsah5T2EgcomgdPh0XQQHCBk0VY8XyoaSKdwNTwVo0G/dkDKkbBHmaGxmM/0g1tygROLcJJV48wp4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwKd0rPVKlnrc6gHpvz8yc+IfjHu3p4UoayG9nRzRz+cu38feIO
	Fh7rLq4EvTcy5dY7ynMZPEPGMOkGfYG3DL2oVfTbEKgNyG2ZU7lj6vhb
X-Gm-Gg: AR+sD12fiiuY7tRhsIXq1oX45uu1xkK0aapnN7dPFkQAAfryuR8VnHUhNtuozzInuty
	HtLBoMw7UZj/TMLtWYvtN7RjYFYL+HJcZwwY3LsMjFVXPSyKSikE9Pk0b+WM1HaSvWQFraDxVKv
	6CpyU1uDsAhijB/5VwbTSVR7Lx+OIAAX/IMUURGdPdjJZc26X1fPODzZs6P2uLvWY8XB/MMBe3x
	QvnrjDCNCc7D/vAaB7IFBozl5WRdW76Z9uiv5LkxDyjCVUmIDTKyP9kYXwdtSd3M3yy3Lji90u4
	LvTd1owGkp/Y/PrnLZ1bHA8qX2D6D7OEs0IQ1j2sto6Oab1iUIStU4BIDs9cJtwB6UYCF6httNf
	B4A53C2N+KngbIP1WTVAXEtlP+Xutnr51AbVg8mNxjbEy1+qyXpf7mcoJVJs3Qc1CwAL86ZNp0f
	IhImpdH3ZzIXTFRyf0tnmaYCNQwve4lnySWDF2YZGEhPr0XYQwihLV62ZJwKDFWhydscchHT8ul
	Cs=
X-Received: by 2002:a17:90b:4487:b0:38e:ab3f:2c99 with SMTP id 98e67ed59e1d1-38fa8094a00mr688435a91.2.1785427471539;
        Thu, 30 Jul 2026 09:04:31 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:31 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 1/8] wifi: brcmfmac: flowring: replace O(N) loop with atomic counter
Date: Thu, 30 Jul 2026 16:03:49 +0000
Message-ID: <20260730160425.11933-1-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Optimizes flowring deletion by tracking counter updates with a flag
instead of an O(N) spinlock walk, fixing a teardown leak.

Signed-off-by: Shivesh <shivesh@example.com>
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

