Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 13BBE1741E8
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923138; cv=none; b=UnEMPOTDcUaPh5VUwWc/Jgps0QgUfVLMUtTLi6jfBKRggy8CViwZAFOp1uy56gPDSD6ES3LEYwnchMoYeuBscknzgILaIGGakFionWhtGBRAG8G2eKHZiyo3rozKjYF+h46x4uFDNR18jjrst/YZ5Sx5kAItJiXnPIFdqm0bwd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923138; c=relaxed/simple;
	bh=JkUkqJ7im0Np8iJE4dAgzWwTvaR+CRh7XcW/vBuE1XI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version; b=FkegERKZRO8Xu3n82vOoYynRoztXfisUEY2lVMFjY0QjrE48QDjfop4Ytld7pmxr8yIRQ9O/9nKHzl82gyjaUi0aXUN/5BudTtgBT+y6PqZ+12P5Cldr8JJ6tCq1NovNDw9hgQZoVBKKyJRO+9XlnesxqChlKpOg+iFVdikZ6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 23E1D6031A648;
	Tue,  2 Jul 2024 20:25:20 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	quic_jjohnson@quicinc.com,
	u.kleine-koenig@pengutronix.de,
	stanley.hsu@cypress.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 2/9] wifi: brcmfmac: avoid garbage value of 'status' in brcmf_c_download_blob()
Date: Tue,  2 Jul 2024 20:24:45 +0800
Message-Id: <20240702122450.2213833-3-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

brcmf_fil_iovar_int_get() reads the value of 'status' and passes it
to brcmf_fil_iovar_data_get(). The garbage value of 'status' will
finally be copied to 'ifp->drvr->proto_buf'. Initialize 'status' to
avoid garbage value.

Fixes: fdd0bd88ceae ("brcmfmac: add CLM download support")
Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
index b24faae35873..03277131ef2b 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
@@ -127,7 +127,7 @@ static int brcmf_c_download_blob(struct brcmf_if *ifp,
 	u32 datalen;
 	u32 cumulative_len;
 	u16 dl_flag = DL_BEGIN;
-	u32 status;
+	u32 status = 0;
 	s32 err;
 
 	brcmf_dbg(TRACE, "Enter\n");
-- 
2.30.2

