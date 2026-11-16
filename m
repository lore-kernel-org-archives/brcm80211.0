Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838418;
	b=qg/XipGt/YzswmWugvh12u2+mjzvYzEgjXrFuqhrYx/lI3Dt39EaxHk74SUikUvhVYvl
	 EBMMUc4QClu0oRLyVQI9BHgTumwEJPhE9tdVeau8MwcmbXK3k6Zro0FU6BaSigR5Z/ikN
	 mDtR0OmmZy6EZwzgzw0j5DHohWlDngBfNBj9rSc9TuBhSjAm9HI/ekjjq6pqSSAQCSE5x
	 vsPuS5HX2A1bDEUesiXsz4KzazzGA5sVfbcIwm/otl1vF+B8moF2LSpIBSzT/HyETawf0
	 BYQpnRBZlgDZG5N9RPzMOy2C3YzqzuyAF6D1UTgUBVbE4sapwHLtfkGLWiCoXi6iaVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838418;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=A27FojnMSCXdxXUOAkXHhWqJrm39BoVP2wyO2sii3vo=;
	b=Y4tgbosvqHuYm3wBDVlFLx9kMN8AvGLS8UVCO4ddwpyulXa0GjtD43nses0kJKV9FrTC
	 OMbGdIdX7YL0+ejTYT8shE/AWuj7+ujRGAa5BmrfQXi0aDzkGnzIzxIVhrLUCdIJHYbHq
	 AeZtx4man4yRuGsUpRHaNRyjBYctBplm1k+lW9FqCicPdjiAm83XYpI5Q2PvYArosS4Uy
	 s9E7K27zUCH/8cK4cJPBQH8P4YUsNrWIiwvNQMaS1M3onyE20Tae52BbfnZwpPbPlXvmc
	 BVbpcfvAtGhT2z6pzK+KQeVwm0DtgZ10ui1Jd9CJnFutR5u1VWkM1Itrx9zzYznVrdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UwaqgKW2;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C6A7606A88A
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 14:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C6A7606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UwaqgKW2
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54db44702;
	Mon, 16 Nov 2026 22:13:25 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: Fix potential use-after-free on monitor registration failure
Date: Mon, 16 Nov 2026 22:13:24 +0800
Message-ID: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e4b49fc903a1kunmbe64bfd010dd11
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx1LVk5MGBkaTk1ITkgfHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=UwaqgKW2kIBsddT2o+CY9HxEt87u68np9Q3If3U5fcIXVtYYF/3Z48eBf5iMtvzug4TDMOsvoj6AQYZDsm4/mr7j24dzrTKVXDN+HMHGlTVDuUSr5+0MDJOMi3B/qCvmny8x7kDI+iMjLmd6l7ELBdBmkhg+CeL5TBJc2WXe5QA=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=A27FojnMSCXdxXUOAkXHhWqJrm39BoVP2wyO2sii3vo=;
	h=date:mime-version:subject:message-id:from;

A failed netdevice registration can invoke priv_destructor while
cfg80211_register_netdevice() still needs the wireless_dev embedded in
the vif. The caller also frees the vif on this error path.

Install the destructor only after registration succeeds, as done for
regular interfaces, and leave failed registration cleanup to the caller.

This issue was found by our static analysis tool under development.
Fixes: 20f2c5fa3af0 ("brcmfmac: add initial support for monitor mode")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 46714d871260..aebc8f7b2a41 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -933,7 +933,6 @@ static struct wireless_dev *brcmf_mon_add_vif(struct wiphy *wiphy,
 	ndev->type = ARPHRD_IEEE80211_RADIOTAP;
 	ndev->ieee80211_ptr = &vif->wdev;
 	ndev->needs_free_netdev = true;
-	ndev->priv_destructor = brcmf_cfg80211_free_vif;
 	SET_NETDEV_DEV(ndev, wiphy_dev(cfg->wiphy));
 
 	ifp = netdev_priv(ndev);
@@ -951,6 +950,7 @@ static struct wireless_dev *brcmf_mon_add_vif(struct wiphy *wiphy,
 		goto err_free_vif;
 	}
 
+	ndev->priv_destructor = brcmf_cfg80211_free_vif;
 	cfg->pub->mon_if = ifp;
 
 	return &vif->wdev;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

