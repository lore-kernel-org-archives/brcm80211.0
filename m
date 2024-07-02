Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 67785171096
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923143; cv=none; b=OyEbVXIMuLk/qYIZt1ohmOqZjnGi+UriyqGboSpwAiXOBR5rE8M94nLwLI12UmONY4XA3GxVP1X/KtAea3P4p4uCKGc6YohetrQFqh8roxqZuMCUB6GOubacXMIZBEgjqfgQBkwcBOabCsKN0fHRyE5e5KcPxce97B0Q/h0MqqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923143; c=relaxed/simple;
	bh=QEHj1YJApM67xSQPt8/HlxK6R7veWsWbHV9VxRLTYK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=IGzXG/sjM2GEsGxZpbo+8s2zkwERuLruFkmwgLJfxUBsOl0G6FrkE8E2Ig+0my8c2rXB02vUEpSSBB9PSZ/2IYJCtie/IQfWsAWCtSo26zvknLjieo1MWsTc5Z1i5unAlPppiDSz3QOPYPFd/kPqtvuyTIU9AkldwbxrJVX8E8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 288AA6031A64D;
	Tue,  2 Jul 2024 20:25:32 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	johannes.berg@intel.com,
	kees@kernel.org,
	a@bayrepo.ru,
	duoming@zju.edu.cn,
	marcan@marcan.st,
	petr.tesarik.ext@huawei.com,
	colin.i.king@gmail.com,
	linville@tuxdriver.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 9/9] wifi: cfg80211: avoid garbage value of 'wsec' in brcmf_cfg80211_{get,config_default}_key()
Date: Tue,  2 Jul 2024 20:24:52 +0800
Message-Id: <20240702122450.2213833-10-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fil_bsscfg_int_get() reads the value of 'wsec'.
Initialize 'wsec' to avoid garbage value.

Fixes: 5b435de0d786 ("net: wireless: add brcm80211 drivers")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 95193e09504f..eb8d7455d0ea 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -2707,7 +2707,7 @@ brcmf_cfg80211_config_default_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct brcmf_if *ifp = netdev_priv(ndev);
 	struct brcmf_pub *drvr = ifp->drvr;
 	u32 index;
-	u32 wsec;
+	u32 wsec = 0;
 	s32 err = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
@@ -2907,7 +2907,7 @@ brcmf_cfg80211_get_key(struct wiphy *wiphy, struct net_device *ndev,
 	struct brcmf_cfg80211_profile *profile = &ifp->vif->profile;
 	struct brcmf_pub *drvr = cfg->pub;
 	struct brcmf_cfg80211_security *sec;
-	s32 wsec;
+	s32 wsec = 0;
 	s32 err = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
-- 
2.30.2

