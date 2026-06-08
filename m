Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756C434888F
	for <brcm80211@lists.linux.dev>; Mon,  8 Jun 2026 05:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895483; cv=none; b=qygL6i+CDzxvtT923vjhri1FR2ZFkjSQKUh2Bl3hCBhytIh7+bKIT/6C96uPYQFfZEeA0CyI74O3iidGuMy0tA4T3HS/H2ZV5nkWSuyJpNbehq4IDky6YD6pw2rokJdI0+9tZFMyAfySHR8dm9zwxk3Otoo8AAkIlBtpsjpg5Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895483; c=relaxed/simple;
	bh=3yHplyP6cPTk7dA8Fbu6IQ+wvbJ9YuU8YxRM56PGb9o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWH4MTb0lmH9iagujGp1Cvsm6uZkJHuKC69qtfkoaNZgVwlZPbRqXv6AJ0vyLGOL24aSxH3BWmSWgCQi3yfaQ+bNiqUknQ+IsByeFkflLRdpvXGJZt91l25IOcKt/1qysUYoJCIMtypoD8aZjffbFgypynkCJzbYaYrWXK/jU3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mkmN1GqV; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mkmN1GqV"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-660e9ea26b9so3550349d50.3
        for <brcm80211@lists.linux.dev>; Sun, 07 Jun 2026 22:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780895481; x=1781500281; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zcd8e+vHsZv7J6v8xRkTQl7Dt+2KjrNT33WGd/GWDII=;
        b=mkmN1GqVzrBuQySv887IrU9HFKTFgOAslSJuwbA2wszfu57TPmRWZjwBTpmyyq7bnh
         KQObCy3Qd4eJxbUe7vLlmbcbpEiCWpkP4qafsw60CVdn5u4cv86RLWJyvF3oYSzeAp/s
         z+Esp6yiefHb5lFqM86+NRig4P1OLLGid1TcI0WvdptojIPTZjVm1FecExVwuA49llcy
         1Cn0pWRqGswckdsLfR2hnQQZi/MZTqHrhNLFbVc8TyiopwmqdTbvfFvmHgUUW4526mpn
         KjM6R+yKuyh4DT87K+k63IlrtwrJPlwebN7aMonGT27psrMr7lGJ52abaauuSWaAJWda
         ZHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780895481; x=1781500281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zcd8e+vHsZv7J6v8xRkTQl7Dt+2KjrNT33WGd/GWDII=;
        b=sbL0B4Hbqp1ySfWw9jK+nFccBx05oh8OUubcY4oPPsC2rZt/aSEpvs+mYBh7+ZAtDc
         Tg08bHGeZmTLH2nQniJy2MU/2ba6vGvT74nwHRoEmaN48rSinzHKXz1MyVBhnqiJcWZB
         W5GjDHUH9FdM0PqcK+uOynjlsUYiUXIaE1mjjB5nsRagczCFSAIoKgJbRqbqgWmwmVXT
         fOkvy8Ikkcpz5MdszT75Gxy8WxYnyD5I46BR//Ovr3Vs7KzYziO9P6zxmhEQK7VYUGX0
         aRl/h31rQFut25Ktb2NVnhMaPPcFaJvrna0dShebcFEjFTL4xz5NZBhwdNurIbHrsZQB
         oNhw==
X-Forwarded-Encrypted: i=1; AFNElJ9LUQqcT1Mnzr2cn25aFAaqghqLp5axGRyuAQ0e8yYxFR4VDlfk593mFSIl1NuQjhQznCDLuSMt1gc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1GqIfGKq6IL3bgAUmCfEqJR+t+mKwSU9zRC2FpyKcbwWydMRG
	XNhN0Ca+qzShczDctTtdOe0gDUXTYE69BvXVwXq9tiQQ8bKtp7qAzYqr
X-Gm-Gg: Acq92OGuDvxubHi88UMIaWhbqJmcTCl12X4if8aDFzYXzuX6nzpqlwmMlHdmcb8ovi3
	FbyfnvtH2FXpdEE+7sM5HdRsMViy4wghwiYcLZ8u9uxKlgBo2eBKSMmRMutAhGpWHVH9sL9EY/N
	JpaQanXBSK+c5paIUhEsORcYGbHCceIDXFGrIJKzSSiSe5Isp6YJ5T0ITCNd0Syzc2oABQIhtnf
	EeTgVUeACcX8yNMtwYsEOEsvAK7nxb3UJN8YhL16Q5wIrtVQ1wa/F7W8pwlLRAkWitb2I3j2ME7
	ehxnFXKX7TAyR1fZlDO866azuYUqPT/UF/CYT/bBvciofb9hjAhWwhQWY4PtBBR8btli6Yam7tH
	Q9fOC+J9msIaFxuU4h9PWkXDeriHrNp2Unc8GLsB8cUobCvZBmzeHtIR1RGTZwJGhQdm8atdP08
	bUPnFo73+6NPINz5m1mnOkqwNOCVOdJMz2mAfQbT6I298VSNpDqEJkxGDU6ocqPjpN3bUzvtzbw
	JaqvJGpSdv6u98l9pZZ8tEjpxyBKO/dA7tu6lur9r/2Gw==
X-Received: by 2002:a53:d016:0:b0:65e:41a4:54c8 with SMTP id 956f58d0204a3-66106f8de50mr11106352d50.56.1780895481549;
        Sun, 07 Jun 2026 22:11:21 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d5f883e2sm8853478d50.6.2026.06.07.22.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:11:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	brcm80211@lists.linux.dev (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	brcm80211-dev-list.pdl@broadcom.com (open list:BROADCOM BRCM80211 IEEE802.11 WIRELESS DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH wireless-next] wifi: brcmfmac: flowring: simplify flow allocation
Date: Sun,  7 Jun 2026 22:11:02 -0700
Message-ID: <20260608051102.6698-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a flexible array member and kzalloc_flex to combine allocations.
Simplifies code slightly.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../wireless/broadcom/brcm80211/brcmfmac/flowring.c    | 10 ++--------
 .../wireless/broadcom/brcm80211/brcmfmac/flowring.h    |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
index df7e3bee19f2..35cbcea0abc9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
@@ -360,20 +360,15 @@ struct brcmf_flowring *brcmf_flowring_attach(struct device *dev, u16 nrofrings)
 	struct brcmf_flowring *flow;
 	u32 i;

-	flow = kzalloc_obj(*flow);
+	flow = kzalloc_flex(*flow, rings, nrofrings);
 	if (flow) {
-		flow->dev = dev;
 		flow->nrofrings = nrofrings;
+		flow->dev = dev;
 		spin_lock_init(&flow->block_lock);
 		for (i = 0; i < ARRAY_SIZE(flow->addr_mode); i++)
 			flow->addr_mode[i] = ADDR_INDIRECT;
 		for (i = 0; i < ARRAY_SIZE(flow->hash); i++)
 			flow->hash[i].ifidx = BRCMF_FLOWRING_INVALID_IFIDX;
-		flow->rings = kzalloc_objs(*flow->rings, nrofrings);
-		if (!flow->rings) {
-			kfree(flow);
-			flow = NULL;
-		}
 	}

 	return flow;
@@ -399,7 +394,6 @@ void brcmf_flowring_detach(struct brcmf_flowring *flow)
 		search = search->next;
 		kfree(remove);
 	}
-	kfree(flow->rings);
 	kfree(flow);
 }

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
index 818882b0fd01..f3d511f9a3c9 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.h
@@ -38,12 +38,12 @@ struct brcmf_flowring_tdls_entry {
 struct brcmf_flowring {
 	struct device *dev;
 	struct brcmf_flowring_hash hash[BRCMF_FLOWRING_HASHSIZE];
-	struct brcmf_flowring_ring **rings;
 	spinlock_t block_lock;
 	enum proto_addr_mode addr_mode[BRCMF_MAX_IFS];
 	u16 nrofrings;
 	bool tdls_active;
 	struct brcmf_flowring_tdls_entry *tdls_entry;
+	struct brcmf_flowring_ring *rings[] __counted_by(nrofrings);
 };


--
2.54.0

