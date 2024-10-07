Received: from smtp14.infineon.com (smtp14.infineon.com [217.10.52.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232AC1D5CDB
	for <brcm80211@lists.linux.dev>; Mon,  7 Oct 2024 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.52.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728311570; cv=none; b=HVbwA44IoYnTstFmmAsQje/bqf/lu5jUKSNgW/nPhkmO0smtHnLOWZ2sPcKYBI1FGrLhhiDLWeqFdbadX7/POHCICFGJ9jYirKwtMCFEav32HmemzdhNHbitTF9RQahqe4+eplswmr3i9KPdl3I+qb4KjXgEZv0a8u/lt3F3wfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728311570; c=relaxed/simple;
	bh=J8msNyeTDvuYBnj5En3qju/N91OCZu3mJIzpeECKVlQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tNQmreJbePMm/2gLZhL2NDWdJX+d6KPpdrj2mbNZbd+fsAicMikz7xO+8VVsVxJepgyc6U7oNRXha9BHYCRD4cZa9kLe0dB5digPkadeuAcv0orE1ZLArPqTfVeplNUYu3ddE5XgvseShlK4aUwbDnAHCmnYsuWJvz7wXyzlA5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com; spf=pass smtp.mailfrom=infineon.com; dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b=hd+m2mO6; arc=none smtp.client-ip=217.10.52.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infineon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infineon.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=infineon.com header.i=@infineon.com header.b="hd+m2mO6"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1728311569; x=1759847569;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J8msNyeTDvuYBnj5En3qju/N91OCZu3mJIzpeECKVlQ=;
  b=hd+m2mO6MXHB5bob7VpQiibxgOOlqFjMbKhkaNgKfuZXY95sx8vysV1m
   p+fulP92MGNjJeb6iOSAfMQNfWM2kmFX3VaCDxbC9twT7O65MET121tmr
   QeCtUa6V26ZNi9TwOW6KUHtct9nEwdZEiJtH3XvY3QAFyrvMj7ZMJCko8
   o=;
X-CSE-ConnectionGUID: vAjnjeyQSe+DXOzhZ/MmLg==
X-CSE-MsgGUID: gX/N/Cv9TOCZr82hi3y56Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="64592824"
X-IronPort-AV: E=Sophos;i="6.11,184,1725314400"; 
   d="scan'208";a="64592824"
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp14.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 16:31:37 +0200
Received: from MUCSE827.infineon.com (172.23.29.20) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Mon, 7 Oct
 2024 16:31:36 +0200
Received: from ISCN5CG14747PP.infineon.com (10.161.6.196) by
 MUCSE827.infineon.com (172.23.29.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 7 Oct 2024 16:31:34 +0200
From: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
To: Kalle Valo <kvalo@kernel.org>
CC: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>, Arend van Spriel
	<arend.vanspriel@broadcom.com>, <Vinoth.Sampath@infineon.com>,
	<Syed.Hussain@infineon.com>, <Double.Lo@infineon.com>,
	<Carter.Chen@infineon.com>, <wlan-kernel-dev-list@infineon.com>,
	<brcm80211@lists.linux.dev>, <linux-wireless@kernel.org>
Subject: [PATCH] MAINTAINERS: wifi: brcm80211: add Infineon DEV list for communication & maintenance
Date: Mon, 7 Oct 2024 19:59:55 +0530
Message-ID: <20241007142955.111232-1-gokulkumar.sivakumar@infineon.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MUCSE810.infineon.com (172.23.29.36) To
 MUCSE827.infineon.com (172.23.29.20)

The Infineon E-Mail distribution list <wlan-kernel-dev-list@infineon.com>
is a replacement for the obsolete list <SHA-cyfmac-dev-list@infineon.com>,
which got removed from the BRCM80211 section in the MAINTAINERS file.

The new distribution list can be used by the community to contact Infineon
WLAN Kernel DEV team, and also for Infineon team to get notified with the
activity in the upstream kernel brcm80211 subsystem.

Signed-off-by: Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77fcd6f802a5..adfbf5af9eb9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4475,6 +4475,7 @@ M:	Arend van Spriel <arend.vanspriel@broadcom.com>
 L:	linux-wireless@vger.kernel.org
 L:	brcm80211@lists.linux.dev
 L:	brcm80211-dev-list.pdl@broadcom.com
+L:	wlan-kernel-dev-list@infineon.com
 S:	Supported
 F:	drivers/net/wireless/broadcom/brcm80211/
 F:	include/linux/platform_data/brcmfmac.h
-- 
2.34.1

