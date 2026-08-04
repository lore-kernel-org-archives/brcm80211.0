Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55E83FADFD
	for <brcm80211@lists.linux.dev>; Tue,  4 Aug 2026 06:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785823952; cv=none; b=TdOERyl/66lZOLsQJwZ/6HoTDoj0BdPBaAniq+VXzTjGnn91MX5j9XngaPnri7T36x5OmdQ+me0xvDPefzI0A4HJQ3qonAJqdmQxBsnnkKiXL/cozW/SdryfcWWkZkfv7Gp+ph/s+zZ1XhVACQZJcx7Cnlt2hALFsnnluoBORUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785823952; c=relaxed/simple;
	bh=K5Ph9XcyqOYkIasx02lR7AFxCwUH0dmM/cCvoQIHRKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+1pN0Y0S0zJ8Dr7TrUzgne2YNMJhSDc42l185IspqyQK+/71T12o4e05w3XvRmIVmTDVlR+7HAogsF1fnC/fyebRQxxyYy9qdUNvizO0ZOeOwboB5x1hL3Cq4IqZzHkTfZ309qkq3r1xAmN+TlPF26d6wX38j6bay3WFaDckY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bvnwQQeL; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bvnwQQeL"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4af83301fb6so112289b6e.1
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 23:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785823950; x=1786428750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lLnrl7cvfXhXnP0TWy+i62c7ISWemwc6cOZstir8oEI=;
        b=bvnwQQeLBxjj0Tueov7S4Oea3ChvN4oycuD6t4Eq3E3net80XLWb98Pf9VKwVyYjCW
         alWPpywH3ky3TTwfmGl84EytvlDnSJgAh+pzdxMD5a1w4ORgRkWTHAhTdHPLG8g1zw5a
         NCh21U+VWP1YuXEKuoJElGtCUL5K78YbPtZt8ekT02GRvCT2Zi0MdsOqWApK53ZCy5p4
         +x/HFEDiGRJTL3mwg5WbyBDrBaaA2x0+oH5nrGpH12mOQ/Jwi8cLcrnhDVj6aKbjfu7m
         CzATfI8+TXh4CXLRTTsqd08h6QICpzvsIjNwnqwLmnI5lVFPO7jWBMmfN6SURcH0Oqgh
         WvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785823950; x=1786428750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lLnrl7cvfXhXnP0TWy+i62c7ISWemwc6cOZstir8oEI=;
        b=MHfhQleq0AjQS6ONxwCmF6ujmD10w8JMNsUUMwhGvQM0mHW7CppI/4P0T4w28/O2bT
         4nlRYQI1Wy2yofnLNHl1GnFAbaKjzfWl/ii4cpOZosjnDhtKOVL70ngzuwscqrUU2iHX
         YqZzBiAWDeGqZdDJ10CIdUFDIoazqCKRYnW1u9gk2dgNthWQ2Nwg40mUm5UuNUc5YJdk
         mBIqIl9HdlZViQHndOeaJxma177LDCJRJA1fy2Z2kWmU9eTwAeWThR/cyeJcActE1bI+
         mMdx70rs5z8yMShD6DAnqSrZJKk+GwDSmlVEsnCRTYN+p+eSIl9PuQvmkhxObWRonBiG
         dRKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr3LhGLQGcJx3w4A0ESsTueVrdx+eghiSHP8yuhIkVWNx+Ih8LLcPk3e0fhqaO3UP1bKFSqCZMAfp0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVERDRFakjl8qgY91+JQXieatB4KHcA4cL6flKpWpXsmJ87JZe
	AvUF0ZGhxsHNvsVqrKeCXfn7gqA6kbBcbmIIiWOUUIuSb/27sQ37a/7Q
X-Gm-Gg: AR+sD11nwBOxN3b9JxY5/7apoRYk07Kc6Lzz64gD4kASkGxBPKDCFRDyNF4YaDXhhtH
	YLZVepsISsy4NVhekoj4c5ma6oaW0ACbIjwz5K+7RhaMvoe5nDLRvuNXeYzmfzTWJi+A3hebckl
	keHRC0z9c+mHVdNGRXGjUE0Y761kqVb72u1Cbgf8UCOnHHufudDnj+9HC33F63+otTbgdIPiqUk
	SIviDffnEw+2a5roeJKEXRZF9AfbfOao6pGAMBmDlcMgDt3dQePzF8kxc02G/HwtQJDX+7Z630z
	AphlWz7VmanKGGi9lxksCf5Q6+aDha7wCHVqrNbl2bEruyyPmX4M9/5CDT5d4686rlSRfhxpiBN
	7uDhtSMrIqk5N+80LpEbRX8Iu8/u+Lf2PdS5zuQL3yYFOpqzpfxd6dhQ5e4Eq6ox9zdQRmJ1Un3
	MF5I9YU41EpZltT9FqBTR62roodc4ooaNPKPyxtDgFURHCxppsDmqZVqfO7PYBlbTPd1qLf4nSt
	xpTZ5AhiySVUhieJXhOOfasmOhTFnFKc7SqSAbvTDiOIGbJwevw/8d/+54GaAc=
X-Received: by 2002:a05:6808:1387:b0:495:ac16:7afa with SMTP id 5614622812f47-4af5e3740eamr13419377b6e.4.1785823949634;
        Mon, 03 Aug 2026 23:12:29 -0700 (PDT)
Received: from antares ([149.88.25.215])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4af58d11372sm7918032b6e.7.2026.08.03.23.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 23:12:27 -0700 (PDT)
From: Bogdan Nicolae <bogdan.nicolae@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] wifi: brcmfmac: cyw: pass PMKID to firmware if present
Date: Tue,  4 Aug 2026 01:08:59 -0500
Message-ID: <20260804060859.412348-1-bogdan.nicolae@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Zero out auth_status on initialization. Otherwise, garbage will
leak from the stack to the firmware (when ssid is less than 32 bytes
and/or when params->pmkid is set). Then, pass the params->pmkid to the
firmware (without it, the firmware caches a garbage PMKID on successful
authentication and denies a subsequent association request that includes
the PMKID).

Fixes: 66f909308a7c ("wifi: brcmfmac: cyw: support external SAE authentication in station mode")
Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
v4: Fixed indentation
v3: Added Fixes, Cc: stable, and Acked-by tags
v2: Split into a separate patch

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
index 873754be5..2c59b5e57 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cyw/core.c
@@ -200,7 +200,7 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 {
 	struct brcmf_if *ifp;
 	struct brcmf_pub *drvr;
-	struct brcmf_auth_req_status_le auth_status;
+	struct brcmf_auth_req_status_le auth_status = {};
 	int ret = 0;
 
 	brcmf_dbg(TRACE, "Enter\n");
@@ -208,6 +208,8 @@ brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
 	ifp = netdev_priv(dev);
 	drvr = ifp->drvr;
 	if (params->status == WLAN_STATUS_SUCCESS) {
+		if (params->pmkid)
+			memcpy(auth_status.pmkid, params->pmkid, WLAN_PMKID_LEN);
 		auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
 	} else {
 		bphy_err(drvr, "External authentication failed: status=%d\n",
-- 
2.55.0
