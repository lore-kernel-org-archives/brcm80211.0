Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 9B46E1741DC
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923137; cv=none; b=n+5pcuhjQuZHMcVawG6G1LWfQlAjLBKTiIRNBoYM0zNmsCfvNT8tkK1VnS837JRUYo2LKFKs16e9Q8pvR8N9uh3ZDH5K33z8OuhjcecZCAyJALMEYSHangqfmpDJQF32EmQNiTOgMoreKwnb3pwqGWAAQzdiN3apRd+NtQVQ1DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923137; c=relaxed/simple;
	bh=Kx4e1MpD4EQQJ0DKqYJ4N5pzOHjFrlzr5NO8css8ljM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=SeU3Jgr//OCiVpkYhVphtdNVDCYebhEzt6xaaJ52CEwZKM/OPjVhFpsizhDtJiWkoCUwM2BhCExOMwf1ojRi1g1404s/++dKPh3Pr9V9YBXGH5uCaSD0l4HZWcDEsk0pTuxvjq4sxgQTjiKOcj64g9bBbHq1IprWBvRu7/VZVIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 014F56031A647;
	Tue,  2 Jul 2024 20:25:23 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	johannes.berg@intel.com,
	kees@kernel.org,
	a@bayrepo.ru,
	marcan@marcan.st,
	colin.i.king@gmail.com,
	zyytlz.wz@163.com,
	petr.tesarik.ext@huawei.com,
	duoming@zju.edu.cn,
	zajec5@gmail.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 4/9] wifi: cfg80211: avoid garbage value of 'chanspec' in brcmf_cfg80211_get_channel()
Date: Tue,  2 Jul 2024 20:24:47 +0800
Message-Id: <20240702122450.2213833-5-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fil_iovar_int_get() reads the value of 'chanspec'.
Initialize 'chanspec' to avoid garbage value.

Fixes: ee6e7aa38394 ("brcmfmac: support get_channel cfg80211 callback")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 2377b88d7ee0..e672565de437 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5678,7 +5678,7 @@ static int brcmf_cfg80211_get_channel(struct wiphy *wiphy,
 	struct brcmu_chan ch;
 	enum nl80211_band band = 0;
 	enum nl80211_chan_width width = 0;
-	u32 chanspec;
+	u32 chanspec = 0;
 	int freq, err;
 
 	if (!ndev || drvr->bus_if->state != BRCMF_BUS_UP)
-- 
2.30.2

