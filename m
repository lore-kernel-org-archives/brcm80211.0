Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2648F31D39A
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093970; cv=none; b=o7F4hKOBZfzcM3Fv8dysowJh+8crrZW+lW2zsCz70m9v465YbWK3cYC3aio0h1VvV1axUozTRitMTPGvqyYYgzKjI5jTteY6we279hbVYI5aD3DfSsEBNkS+h0euAloPA+flrU3JRLxYTn71Rsk9X9SQFAIiH6fujK422SEuP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093970; c=relaxed/simple;
	bh=1LOZSaWG2uzh/DCffSMH3rPaWMoMWYdMtKwtKAk9vLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pkPLMCYi5guHWeQUwz6RkxkOqqUzB1JuLH67heu0oiJU4uq/0Nz620nR2mCQikmr2JfodaOUuIf4oz58zCIwwKrUtXxeJshLhKR9osC1gb7OjyuYc/WRtP3W80tU1FRQOjnO0AbRPDGNQhJbeeLwz7e5h+62sbPJCyq630tzT0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=US50Nv3V; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="US50Nv3V"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1367501a91.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093968; x=1785698768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=E7nAlkFdxdeeYQtyvkWlvUFmLyPqax7y31tdZr57LQeDwJ0D7LFxsx6RBnO7Vh4WI9
         mQPf5Gbf7ZblJXcu9QkhRaBXODL/ojobj4w08wa8gAx7zLIQi96TWJqFZl7+B83KdwK7
         FE1x4o9pVUWaFzuq9QMIAka4apRO6CDspXmDT3N852JqWV/109h3CLtN9G+ICPeibJ5v
         IHlII+3VdKVdWK6hz3EcnYDIH/ZHYKUK9/Oclt9wQ4d15QtztNf4qt9XIheUMe18UcyZ
         pvjYakyK+xaYCuU/K69+8XZIVLVtlC1sfFWoNN4ey3NCawduV1305xFQW/+3j6hUp8Dm
         4MNg==
X-Forwarded-Encrypted: i=1; AHgh+RqgXCSj3Ujbbs6Mx3Ns0Wy9GT86Unv4i5IFOlKvkcGMcCFMfhRjllv2PJFm/6fusLQbDKS9WA+1ykI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8K6qF4GVclP7BJsLatI+vWYe6VhtSzbIebjiEcWdxYFWz2iS1
	WIavXc9Kp8y8L2JpwcnuA6ZpqiEe8xN0bTOEJWXB+MsSIJi1aNXJ7xfE/AiL7g6PiR5EJosTQRN
	1wjP5NNTamj4X+urag08WDEtovEPDdgphYaQd5wwlhr051nOGNZ3IvD7JgDMOv5f3LuX9dIuCNR
	QPP39whvW1xIVqVj0fNhLqO8rYiihSXQUXb+6xDrfEoCfRX2Cw3QaT4XSkdwHj6Ot0nT9f3Bq7t
	RcNUz7+kYtO2RF9TBI0Yg==
X-Gm-Gg: AR+sD12h7TVuh2IdGVTlzVymIgQgIbLitetDCACVIcN03VFdSo1MXJrkuxczwi5LT5A
	7mUZFE/Oi8tYy0Ok/flgOMGSTAw5XsUezMzb63T1d5Tn7rS9lvr1tu7u4CFvH5pAm7kRH1H1kXl
	QdviWsKageOju2zE9AszQFgC5UglDv3Vql4k50k6Y+rbj/CGEtnJMxUDbaPwMnxxPMw9MkU1JIl
	t6IZXA650eO7p2EThJXvssfyGr2ojEj69vW+NG1xdxfuw5WK8TJVZNl71HjJdmKT8p+90Hs08EG
	D5yd15nsH9/DAsAs/yaoFKT7GMs1VbxFCDOQ14+uO2Nks5uSF+HaRGUJO/xvLd7be8c51JSx3uv
	oGZ7dwY0AnKPEEjumDBso9aey0O9etRxhILlWoW+xZ7OBhHlHZErBMAt39Aev2AJQ8Y3bafAg/X
	3vpg/YPT1ytZmhY1IAqfmAqv5K1QY4Lph21hQkFGs=
X-Received: by 2002:a17:90b:4a09:b0:38e:673:5d18 with SMTP id 98e67ed59e1d1-38f2977c1cfmr5653904a91.36.1785093968397;
        Sun, 26 Jul 2026 12:26:08 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-73.dlp.protect.broadcom.com. [144.49.247.73])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-38f2a403feasm323173a91.8.2026.07.26.12.26.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:26:08 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-381250979d5so172863a91.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093965; x=1785698765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vw8UsAkLTYYubS2GArrnvTGyTO7xTPOjCEXxf9oqMpo=;
        b=US50Nv3VhnqM+JYMuG1HGh2Kc2ZvZGdUiUSb3g4vyJXxYeQMDnLmYveOvDT9wpY265
         aqSG6hPKhjYLp5oVh+hyIwfJXJovEM7tLYP8793SFG3NGoM6D9BtgxUaP1sj4AOs8Xoc
         JZSmpnVzlmY0bYCPUaA20KmcRz38eqMZ/801w=
X-Forwarded-Encrypted: i=1; AHgh+RqgizDxQKHI/UxwoBsUMfNMJjtQqpLAZ7xASOoqD0oenJDrXFtN2g5c9xmA7IxjrDZisqhpj9POVMc=@lists.linux.dev
X-Received: by 2002:a17:90b:3845:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-38f293cd3edmr5666635a91.3.1785093965194;
        Sun, 26 Jul 2026 12:26:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3845:b0:38e:5ac1:9517 with SMTP id 98e67ed59e1d1-38f293cd3edmr5666613a91.3.1785093964714;
        Sun, 26 Jul 2026 12:26:04 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:26:04 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 07/10] wifi: wilc1000: use pre-assigned cookie for remain_on_channel and mgmt_tx
Date: Sun, 26 Jul 2026 21:25:38 +0200
Message-ID: <20260726192541.2816743-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Stop generating cookies by incrementing inc_roc_cookie in
remain_on_channel() and via get_random_u32() in mgmt_tx(). Use the
pre-assigned cookie from cfg80211 instead. Remove the now-unused id
local variable from remain_on_channel().

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 6654fce4ded8..7c19ad34fda5 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1106,18 +1106,13 @@ static int remain_on_channel(struct wiphy *wiphy,
 	int ret = 0;
 	struct wilc_vif *vif = netdev_priv(wdev->netdev);
 	struct wilc_priv *priv = &vif->priv;
-	u64 id;
 
 	if (wdev->iftype == NL80211_IFTYPE_AP) {
 		netdev_dbg(vif->ndev, "Required while in AP mode\n");
 		return ret;
 	}
 
-	id = ++priv->inc_roc_cookie;
-	if (id == 0)
-		id = ++priv->inc_roc_cookie;
-
-	ret = wilc_remain_on_channel(vif, id, chan->hw_value,
+	ret = wilc_remain_on_channel(vif, *cookie, chan->hw_value,
 				     wilc_wfi_remain_on_channel_expired);
 	if (ret)
 		return ret;
@@ -1125,8 +1120,7 @@ static int remain_on_channel(struct wiphy *wiphy,
 	vif->wilc->op_ch = chan->hw_value;
 
 	priv->remain_on_ch_params.listen_ch = chan;
-	priv->remain_on_ch_params.listen_cookie = id;
-	*cookie = id;
+	priv->remain_on_ch_params.listen_cookie = *cookie;
 	priv->p2p_listen_state = true;
 	priv->remain_on_ch_params.listen_duration = duration;
 
@@ -1170,7 +1164,6 @@ static int mgmt_tx(struct wiphy *wiphy,
 	const u8 *vendor_ie;
 	int ret = 0;
 
-	*cookie = get_random_u32();
 	priv->tx_cookie = *cookie;
 	mgmt = (const struct ieee80211_mgmt *)buf;
 
-- 
2.54.0

