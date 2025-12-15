Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620A5227599
	for <brcm80211@lists.linux.dev>; Mon, 15 Dec 2025 10:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765795113; cv=none; b=GXInzV75UOg+WcD4PuPANmEqsBuYWAE9X83JgBZb8/I1dUgfxs0IhM/pRDxqN2vgB5oxIf7I/WkcSUSxMpJ+ErO447WktvU6BCcpQYbyJFnATlMhlkc/UQ3xjVepFLKHPIz0LP8bFTWW50ay8u4efuFg1i/iCdrJtZ/tPw5TCcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765795113; c=relaxed/simple;
	bh=zMGvzUoo5Bn0KmMQfTuF6AAZJfcgkULR7Y3JFpKuYzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tWhKVHVGYI5yFV8ijYAxh5V+mM8KZ3loNsZ5s0hiG5IGBLtGVSmc/hG9ZggKnk6M4B+i3RotXalPNrWtBDXfcp40+HJFotVcr8Y+hOT7bIG9+q64jVF9VlnyxXUd25m4z0dGv4/JAxqdbQGtN0SdmBpU5UWxIIJXkFmzuy2Y1YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2ZLAfvE; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2ZLAfvE"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b728a43e410so527653566b.1
        for <brcm80211@lists.linux.dev>; Mon, 15 Dec 2025 02:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765795110; x=1766399910; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkVNILE1twK6/ovsJ6T9ryNNhv5sOBklW/SMHDSmqFQ=;
        b=k2ZLAfvEgctPK714J8nFy97nD1Y7OLgWvmUah1d+p1/K4U2BTym7n0fJxLViqWmb3K
         W+vcEU+Kuq7HiKzhq6WZvYx+RFNXsRde9KeF/dHQkFIcOxBMdhzXRGx7JqTQAxhfw2Kh
         Yv+xzJyNsZK8jbgDGbcHLH8W3LrRKi0zR34qJJq6+LS/sDpz/xHOPew6dA5f+bTGS5LF
         0JIxGoghCOGk2slWQ+8AfCXGyN9PrHKQHXCnlP1YD8Wa5Cxarw0tga8tMlyVT3DdO6Pt
         rSn2CxR+RQBATT2sQKYS3zQF8+KaK9XLLHSk10Xo83rUE4xWgbs+C4IND4vgqvp1xITi
         UlQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795110; x=1766399910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IkVNILE1twK6/ovsJ6T9ryNNhv5sOBklW/SMHDSmqFQ=;
        b=DNOeRYS/CxuQv1Dx/yywaVolulfk5xZfNqkOy0o4w5Svrq6bJO5KXao0oA53cO8UDa
         TZZnZGqCCB72G5UpfdfWIRdf57qQP/ZpSsXG35E1P8ecAfOrsayJOjYR/ekAMpOGsrAc
         LO+AG15aaM2m5Yq0N7tKXKF6wRGkUmOKjLKOHcKpPilITyigQymb60YSZ4SLpvQ2Z92x
         cxrNw0F1EI/V5bu5VS6Fk8n9cdnVE8YvCWOpKxmI5GDyzMbRN5X9O4m/NfagVPip6QhC
         h9NkHKkqaXGF9lXzlstbtEr4Uc19YMo1QA3u5VVbtVwjDvGAORNFyW91cgcxYOmfUhhE
         7Dkw==
X-Forwarded-Encrypted: i=1; AJvYcCW0GMgeZ4iX79MNK3mOjeONIAk5NGRP7/AwIUKkMLrVVyRQjQIHro+iGsn4gr+5kbAFErkGP2Fv/v8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxvkFv7jFyHcBZWr+hHUquw5C8b4Wa/xvGq7Xys1Ux2rHRCzMij
	RtXyJ08yZ253IuA6ujqYIepxx3uTIOdr9+EsubUgzcCb/g+UTXAepmEU
X-Gm-Gg: AY/fxX7MxdBeWKvjBwUJS0m2PDusFMkcFNCimpXTwHivuqhuW462DLnv350cOwTLzPH
	OntDXsMiJq0Di7j1x7Is8F0oNJdEqEkNhyQ285Wv8g2E/OpVtTigMQQSoYfFZ2N8nXge7+iAtOs
	hGiyjHoguPxKkZqsyBPG1JoRGNhOOURLsdcDJV40KCEXDb8KqmIheiE13nw2FZc9/nXRmsUY54v
	G6sZU4H3o6Ea4EwllKYG5wthJb8utntJvH80AehH2ZVtRY1P7IZQDrOvC1KQCJKi8IrE9fObHiK
	3l4NDc3b60r0LWRAwtA57TrJ1o7xN0YOLEi04xOp5qIWB3fejZK7aTfUzjRBsPcv5s+IiyFfeUZ
	mwHBQGWnpwtjrXTy5euzQ95jp871eiqa2mxNWNCEWqPNVgEa4MUYiRMIjSAv/zS23bapklVZR3C
	KYvXsfXs9cq4uSbbv/Kzz6
X-Google-Smtp-Source: AGHT+IF9KlvlgaGfO6yM+8uE1EgcX4/5Lr9MP+SD3ltl4f/PPm+KO8gXV2ylgqQge9Zel7YoPSeBqg==
X-Received: by 2002:a17:907:7f27:b0:b79:c879:fe71 with SMTP id a640c23a62f3a-b7d23a47753mr1031258566b.19.1765795109498;
        Mon, 15 Dec 2025 02:38:29 -0800 (PST)
Received: from localhost.localdomain.pl ([89.151.31.85])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ed80dsm1363738666b.16.2025.12.15.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:38:28 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Ting-Ying Li <tingying.li@cypress.com>,
	Chi-hsien Lin <chi-hsien.lin@cypress.com>,
	Ingo Molnar <mingo@kernel.org>,
	Wright Feng <wright.feng@cypress.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Roopni Devanathan <quic_rdevanat@quicinc.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Chung-Hsien Hsu <chung-hsien.hsu@infineon.com>,
	Ian Lin <ian.lin@infineon.com>,
	Kalle Valo <kvalo@kernel.org>,
	Alex Shumsky <alexthreed@gmail.com>,
	Marcel Hamer <marcel.hamer@windriver.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] wifi: brcmfmac: rename function that frees vif
Date: Mon, 15 Dec 2025 11:38:17 +0100
Message-ID: <20251215103817.29598-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Since the commit cf124db566e6 ("net: Fix inconsistent teardown and
release of private netdev state.") netdev isn't freed anymore in the
brcmf_cfg80211_free_netdev(). Adjust this function name to match what it
actually does (freeing vif).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++--
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h | 2 +-
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c     | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index bb96b87b2a6e..61f7e620cab3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -932,7 +932,7 @@ static struct wireless_dev *brcmf_mon_add_vif(struct wiphy *wiphy,
 	ndev->type = ARPHRD_IEEE80211_RADIOTAP;
 	ndev->ieee80211_ptr = &vif->wdev;
 	ndev->needs_free_netdev = true;
-	ndev->priv_destructor = brcmf_cfg80211_free_netdev;
+	ndev->priv_destructor = brcmf_cfg80211_free_vif;
 	SET_NETDEV_DEV(ndev, wiphy_dev(cfg->wiphy));
 
 	ifp = netdev_priv(ndev);
@@ -6082,7 +6082,7 @@ void brcmf_free_vif(struct brcmf_cfg80211_vif *vif)
 	kfree(vif);
 }
 
-void brcmf_cfg80211_free_netdev(struct net_device *ndev)
+void brcmf_cfg80211_free_vif(struct net_device *ndev)
 {
 	struct brcmf_cfg80211_vif *vif;
 	struct brcmf_if *ifp;
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
index 273c80f2d483..350286db5f0a 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.h
@@ -489,7 +489,7 @@ s32 brcmf_notify_escan_complete(struct brcmf_cfg80211_info *cfg,
 void brcmf_set_mpc(struct brcmf_if *ndev, int mpc);
 bool brcmf_is_apmode_operating(struct wiphy *wiphy);
 void brcmf_abort_scanning(struct brcmf_cfg80211_info *cfg);
-void brcmf_cfg80211_free_netdev(struct net_device *ndev);
+void brcmf_cfg80211_free_vif(struct net_device *ndev);
 
 int brcmf_set_wsec(struct brcmf_if *ifp, const u8 *key, u16 key_len, u16 flags);
 int brcmf_cfg80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index 862a0336a0b5..616885d6db3f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -674,7 +674,7 @@ int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
 
 	netif_carrier_off(ndev);
 
-	ndev->priv_destructor = brcmf_cfg80211_free_netdev;
+	ndev->priv_destructor = brcmf_cfg80211_free_vif;
 	brcmf_dbg(INFO, "%s: Broadcom Dongle Host Driver\n", ndev->name);
 	return 0;
 
@@ -692,7 +692,7 @@ void brcmf_net_detach(struct net_device *ndev, bool locked)
 		else
 			unregister_netdev(ndev);
 	} else {
-		brcmf_cfg80211_free_netdev(ndev);
+		brcmf_cfg80211_free_vif(ndev);
 		free_netdev(ndev);
 	}
 }
-- 
2.51.0

