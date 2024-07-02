Received: from mail.nfschina.com (unknown [42.101.60.195])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D5A5E16B749
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 12:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=42.101.60.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719923140; cv=none; b=XrLdqczryGMZJeKbgOn6Zf1tlyXEufc9MTPHx+TUjfLDScBQBh9rIde3c9wqSZmwCa0HVUJklW6Y5ZA4BvXstYpXOA7Lo0wheYUSmsXUZ3IBnmcnARtEVfgCtAIpRGsldKfq27N/OrcjMKIEb7Chs9FqwoNchNJLnzQNP6yPgUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719923140; c=relaxed/simple;
	bh=N1K5vqUOUCTzc4m7/1paZZiWuB+U2yJoeN9sfduGBOo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TNA6c+Mb3fhlDA64J/e5G/TsS+VHDTJBEI60saxSdbMOZzFG3RAwDy7VlpSanSNf3GCgV/wgKXxRfUm0Gy4/3U4IXyXxi7UfS0V0VXPJSJnlKm1Zi/mYAvUcWYwKr53inANq89mjTPpG1c8Bz4FCb5r0XKq9iqAETsL6vwuAppw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com; spf=pass smtp.mailfrom=nfschina.com; arc=none smtp.client-ip=42.101.60.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nfschina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nfschina.com
Received: from localhost.localdomain (unknown [180.167.10.98])
	by mail.nfschina.com (MailData Gateway V2.8.8) with ESMTPSA id 4FAA36031A631;
	Tue,  2 Jul 2024 20:25:14 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: arend.vanspriel@broadcom.com,
	kvalo@kernel.org
Cc: Su Hui <suhui@nfschina.com>,
	johannes.berg@intel.com,
	kees@kernel.org,
	a@bayrepo.ru,
	quic_alokad@quicinc.com,
	zyytlz.wz@163.com,
	marcan@marcan.st,
	petr.tesarik.ext@huawei.com,
	duoming@zju.edu.cn,
	colin.i.king@gmail.com,
	u.kleine-koenig@pengutronix.de,
	quic_jjohnson@quicinc.com,
	linville@tuxdriver.com,
	pieterpg@broadcom.com,
	meuleman@broadcom.com,
	frankyl@broadcom.com,
	stanley.hsu@cypress.com,
	wright.feng@cypress.com,
	ian.lin@infineon.com,
	chi-hsien.lin@cypress.com,
	zajec5@gmail.com,
	antonio@open-mesh.com,
	franky.lin@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH wireless 0/9] wifi: cfg80211: avoid some garbage values 
Date: Tue,  2 Jul 2024 20:24:42 +0800
Message-Id: <20240702122450.2213833-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang static checker (scan-build) has some warnings as follows.

included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:16
drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:2:
warning:Assigned value is garbage or undefined [core.uninitialized.Assign]
  123 |         __le32 data_le = cpu_to_le32(*data);
      |         ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3:warning
Value stored to 'err' is never read [deadcode.DeadStores]

There are some functions like brcmf_fil_{cmd,iovar,basscfg}_int_get() 
which read the value of its parameter, but some callers have not 
initialized these parameters which will be read. And this patchset fixes
these problems.

BTW, maybe merge this patchset into one patch is more better because
the num of changed code is small. I split it into multiple patches
because of these different 'Fixes' tags. 

Su Hui (9):
  wifi: cfg80211: avoid garbage value of 'io_type' in 
    brcmf_cfg80211_attach()
  wifi: brcmfmac: avoid garbage value of 'status' in
    brcmf_c_download_blob()
  wifi: cfg80211: avoid garbage value of 'noise' in
    brcmf_cfg80211_dump_survey()
  wifi: cfg80211: avoid garbage value of 'chanspec' in
    brcmf_cfg80211_get_channel()
  wifi: cfg80211: avoid garbage value of 'freq' in
    brcmf_cfg80211_mgmt_tx()
  wifi: cfg80211: avoid garbage value of 'wsec' in
    brcmf_cfg80211_reconfigure_wep()
  wifi: cfg80211: avoid garbage value of 'wsec' in
    brcmf_cfg80211_add_key()
  wifi: cfg80211: avoid garbage value of 'val' in brcmf_set_key_mgmt()
  wifi: cfg80211: avoid garbage value of 'wsec' in
    brcmf_cfg80211_{get,config_default}_key()

 .../broadcom/brcm80211/brcmfmac/cfg80211.c     | 18 +++++++++---------
 .../broadcom/brcm80211/brcmfmac/common.c       |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.30.2

