Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9B4201741DB
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923138; cv=none; b=Ta/3LtWyBjUGRxH3A/zcDaXCdLfpWrK+DlVvtPr5vgU9m7fDZokKUGZ+leP6JYRC6klGPPf2fACf94yQerdzkkaHdfEUyX9MsKdEu5Z/6IaBkyIlkQobsAU7RY6C/ZCXhVyJYRWB+dl/VtTwku3yuLUogl9kb3/FWGFiBH4xgg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923138; c=relaxed/simple;
	bh=evAy6djT8Jz+ckPi7/Gdz/7kZj/4vFauA7ksswOC9/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=b3oNU4KaM8Y6b4pvzC8391vpyLcn7verpj46d5c7BTsH4WdquXchgbFsly3MsjdVf1p6OoCPTAFAf7DkGkmB8K6u+FoauVjQ0JSuyMk+N3d9PbUc3Bu2R8jprboPVig4aACYAYvMzA7Uu/BcgGwRwoTaodFYPuiu1jzayhE8l2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 632836031A638;
	Tue,  2 Jul 2024 20:25:22 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	johannes.berg@intel.com,
	kees@kernel.org,
	a@bayrepo.ru,
	petr.tesarik.ext@huawei.com,
	marcan@marcan.st,
	justinstitt@google.com,
	duoming@zju.edu.cn,
	colin.i.king@gmail.com,
	chi-hsien.lin@cypress.com,
	ian.lin@infineon.com,
	wright.feng@cypress.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 3/9] wifi: cfg80211: avoid garbage value of 'noise' in brcmf_cfg80211_dump_survey()
Date: Tue,  2 Jul 2024 20:24:46 +0800
Message-Id: <20240702122450.2213833-4-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fil_cmd_int_get() reads the value of 'noise' and passes it to
brcmf_fil_cmd_data_get(). Initialize 'noise' to avoid garbage value.

Fixes: 6c04deae1438 ("brcmfmac: Add dump_survey cfg80211 ops for HostApd AutoChannelSelection")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 6be7e7bd8ce7..2377b88d7ee0 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -8084,7 +8084,7 @@ brcmf_cfg80211_dump_survey(struct wiphy *wiphy, struct net_device *ndev,
 	struct ieee80211_supported_band *band;
 	enum nl80211_band band_id;
 	struct cca_msrmnt_query req;
-	u32 noise;
+	u32 noise = 0;
 	int err;
 
 	brcmf_dbg(TRACE, "Enter: channel idx=%d\n", idx);
-- 
2.30.2

