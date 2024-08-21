Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849A245C0B
	for <brcm80211@lists.linux.dev>; Wed, 21 Aug 2024 02:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724207174; cv=none; b=MVf0Fg19NStsiWiYJEIWeDtF8+pJt8yp6jaumdKWcfoRO3BLzgmOW7Cyee1Gwhd0bt717/YjL3HqVcDuaIeWAHMYG+fPIkDLDa4KT4j3uPQwXMEVCEGQIkQ57oGkZvUW5Ute5tJ9L8tKRaQvLw8XJPuSxeeiZ2SWtbMfZ7/R9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724207174; c=relaxed/simple;
	bh=yQMJjuO/BJYdld1tuMGXVh9vgQ8x/bEM2wmjjr8ymoA=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=udOXWwvsH+o3P+bQPHduME62UFwNMhmzTjRgBYMIeNpOu4OG9ds/f997XVeaGUxRgbUdegePeQXTgSYpr2oApL14egvYDy6wlpG3eUaDg8y0c9VQkzT7O732YUdCHkEwOs4V5tqPWw6aygRgL+tRsDZfhoxP8rp7lb+LBIk2RLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4WpVWp4BDmz1xtrJ;
	Wed, 21 Aug 2024 10:24:06 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id EAC50140154;
	Wed, 21 Aug 2024 10:26:00 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 21 Aug
 2024 10:26:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <arend.vanspriel@broadcom.com>, <kvalo@kernel.org>,
	<johannes.berg@intel.com>, <emmanuel.grumbach@intel.com>,
	<ruanjinjie@huawei.com>, <erick.archer@outlook.com>,
	<linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>,
	<brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] wifi: mac80211: Use kvmemdup to simplify the code
Date: Wed, 21 Aug 2024 10:33:25 +0800
Message-ID: <20240821023325.2077399-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use kvmemdup instead of kvmalloc() + memcpy() to simplify the code.

No functional change.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
index d86f28b8bc60..7717d7764d2d 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c
@@ -1611,10 +1611,9 @@ int brcms_ucode_init_buf(struct brcms_info *wl, void **pbuf, u32 idx)
 			if (le32_to_cpu(hdr->idx) == idx) {
 				pdata = wl->fw.fw_bin[i]->data +
 					le32_to_cpu(hdr->offset);
-				*pbuf = kvmalloc(len, GFP_KERNEL);
+				*pbuf = kvmemdup(pdata, len, GFP_KERNEL);
 				if (*pbuf == NULL)
 					goto fail;
-				memcpy(*pbuf, pdata, len);
 				return 0;
 			}
 		}
-- 
2.34.1

