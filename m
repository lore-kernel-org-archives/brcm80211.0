Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382703D2FF4
	for <brcm80211@lists.linux.dev>; Wed, 22 Jul 2026 08:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708915; cv=none; b=B8r+59RAPCIxaKWvw3L1PLrmQfan9TS8cT9RBiplMO/QfRbnqEUU+f71nwuDLJ16yGAdvTSuDGFKabBO895jHbxATDltJA5FEFLZxNjFUsncvEz+j4W7PODvU06qlHIYLa39QpFNCfBhU3j5QlUIXp58hZUSEm2GzZH6rUqVs08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708915; c=relaxed/simple;
	bh=EixoOQ7z6M70FC6xow3sUPIAwW+cfs5a/52T3oyotk4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TDQehfn/ejiiI0zD9LRqdyBdVsCPj3OJBteIN6B8sZ7mh42pAXHqq7bIbCWPXB7GudkvuWIcyVoLbOv92ttCJ9kxD0WrbjFOSVSDR/sh/hMSFcrvx8eFzfnBdLNOLbPd3xAcs9pBDmbqmkZf+boWjh1dlNa910SF+gmvJBVH6yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=qRlAIoSP; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="qRlAIoSP"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1784708911; x=1816244911;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EixoOQ7z6M70FC6xow3sUPIAwW+cfs5a/52T3oyotk4=;
  b=qRlAIoSPYytiAeNzmk4MvXZZdlqdhk5iaWz8PuyMMm+ABiFTHzmOXAmq
   9pNZLMb6NCBBNVmtmX2nrEO4zUopfI7Kcq99DTl18O7k6kS++/deEiiOh
   qTuJcxZiywa6Sufibg9k95E0SFVBdpw7K8N16t0oT78kiMs/jW+YwcK8K
   w=;
X-CSE-ConnectionGUID: +Fjbd8AoQAK97Dyf0VrqgA==
X-CSE-MsgGUID: IGo3ju6GSlezfUvYRr7D/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="138945297"
X-IronPort-AV: E=Sophos;i="6.25,178,1779141600"; 
   d="scan'208";a="138945297"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE819.infineon.com) ([172.23.29.45])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 10:27:14 +0200
Received: from MUCSE809.infineon.com (172.23.29.35) by MUCSE819.infineon.com
 (172.23.29.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Wed, 22 Jul
 2026 10:27:13 +0200
Received: from ISCN5CG5251XQT.infineon.com (10.161.6.196) by
 MUCSE809.infineon.com (172.23.29.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 10:27:11 +0200
From: Jason Huang <Jason.Huang2@infineon.com>
To: <linux-wireless@vger.kernel.org>
CC: <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>,
	<linux-kernel@vger.kernel.org>, Jason Huang <jason.huang2@infineon.com>
Subject: [PATCH] wifi: brcmfmac: fix P2P action frame handling without device vif
Date: Wed, 22 Jul 2026 16:26:08 +0800
Message-ID: <20260722082608.412472-1-Jason.Huang2@infineon.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE815.infineon.com (172.23.29.41) To
 MUCSE809.infineon.com (172.23.29.35)

From: Jason Huang <jason.huang2@infineon.com>

Some P2P action frame paths assume the P2P device vif is always
available. That is not true when userspace sends non-P2P public action
frames through the primary interface, or when action-frame abort runs
after the P2P device vif has not been created.

Fall back to the primary vif when aborting an action frame without a P2P
device vif, and guard P2P device saved IE access before using it for
peer channel search.

Fixes: 30fb1b272909 ("brcmfmac: use actframe_abort to cancel ongoing action frame")
Fixes: 6eda4e2c5425 ("brcmfmac: Add tx p2p off-channel support.")

Signed-off-by: Jason Huang <jason.huang2@infineon.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
index 92c16a317328..66557be28e7b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c
@@ -1283,6 +1283,9 @@ static s32 brcmf_p2p_abort_action_frame(struct brcmf_cfg80211_info *cfg)
 	brcmf_dbg(TRACE, "Enter\n");
 
 	vif = p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif;
+	if (!vif)
+		vif = p2p->bss_idx[P2PAPI_BSSCFG_PRIMARY].vif;
+
 	err = brcmf_fil_bsscfg_data_set(vif->ifp, "actframe_abort", &int_val,
 					sizeof(s32));
 	if (err)
@@ -1819,6 +1822,7 @@ bool brcmf_p2p_send_action_frame(struct brcmf_if *ifp,
 	/* validate channel and p2p ies */
 	if (config_af_params.search_channel &&
 	    IS_P2P_SOCIAL_CHANNEL(le32_to_cpu(af_params->channel)) &&
+	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif &&
 	    p2p->bss_idx[P2PAPI_BSSCFG_DEVICE].vif->saved_ie.probe_req_ie_len) {
 		afx_hdl = &p2p->afx_hdl;
 		afx_hdl->peer_listen_chan = le32_to_cpu(af_params->channel);
-- 
2.25.1

