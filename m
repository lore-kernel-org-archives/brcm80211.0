Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 72285167296
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923141; cv=none; b=P9/lVetfv9zsxtOQ1jLSRoaVU4dkVWnVmjv1CPeyO+wPbxzlr5fqgSGBbD84rTjGCTcCUKmn0+WSCsQqTcBBppDK5XmD+ClBopIfnW0XCjEBp6DT0Z6KJGD6Ixu043TX5neYip9UnfDyl1XgMUJ+GpcVcE5EQCUx9as4FqW0A54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923141; c=relaxed/simple;
	bh=re5hCi09bz4bN2XgE8UnJKMOfANVbB9O+r83cPT08rE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=ROc5HpoEb8gka4vzr6sltAd/1oL60y0rE9j7Iv4x16ULquyujiPz5RSQaGUu8R6VXbIwDVsl03RYFS38by9XDVunGetbVhKTstbv713zk+76je1vEyUSZckjPlyPWsuL3Pu0o4n4L+cQBPJtPU4Qi6/uuR7QZyhHnFDlW6h1Dfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 8E4146031A64E;
	Tue,  2 Jul 2024 20:25:30 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	johannes.berg@intel.com,
	kees@kernel.org,
	a@bayrepo.ru,
	colin.i.king@gmail.com,
	marcan@marcan.st,
	zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com,
	hante.meuleman@broadcom.com,
	pieter-paul.giesberts@broadcom.com,
	franky.lin@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 8/9] wifi: cfg80211: avoid garbage value of 'val' in brcmf_set_key_mgmt()
Date: Tue,  2 Jul 2024 20:24:51 +0800
Message-Id: <20240702122450.2213833-9-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fil_bsscfg_int_get() reads the value of 'val'.
Initialize 'val' to avoid garbage vlaue.

Fixes: 240d61a9ddeb ("brcmfmac: add 802.11w management frame protection support")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 2a97d4d7f684..95193e09504f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -2085,7 +2085,7 @@ brcmf_set_key_mgmt(struct net_device *ndev, struct cfg80211_connect_params *sme)
 	struct brcmf_if *ifp = netdev_priv(ndev);
 	struct brcmf_cfg80211_profile *profile = &ifp->vif->profile;
 	struct brcmf_pub *drvr = ifp->drvr;
-	s32 val;
+	s32 val = 0;
 	s32 err;
 	const struct brcmf_tlv *rsn_ie;
 	const u8 *ie;
-- 
2.30.2

