Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978B3ECBDC
	for <brcm80211@lists.linux.dev>; Thu,  7 May 2026 10:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151050; cv=none; b=hGw5mkpSech8WYGnQueO6BWnDv83xazxB/nILc5F2Rhw/52uMIgbpe3Fcc3OkaqhH+xTvcqjNL4T2WtJpZyNU1F0R/ByPti/hhVHG4Z24BjhVPi3GImgjB+vdI8v8wnpKRcnXXZ3nbDZF3AXiZ5SaBuDoj/DvFzkYqgKHIYIfaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151050; c=relaxed/simple;
	bh=F0wkHe4/N6VROpz2ZLwqmJpO+q0ZH2sv57Ij/hqtPPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hTILbJpcAaqG6ND7ROghAyiGSWTBJ6LQN3pNAMGyLUedoOrot5hX4VzBHRhCGn/woO82EjDCIVGpXycldVl8TQNXFQrcx24MC9eqm4W6uhTLJ6wmlSA+EeoYErP+WNW1IYV04PdKyBYsdrf6f4UQCBU5hVhh+oZU4CUhgF9gEI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=CE3NDzJZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="CE3NDzJZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so8664755e9.0
        for <brcm80211@lists.linux.dev>; Thu, 07 May 2026 03:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778151031; x=1778755831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MEhC5xMmaOs+y5n/VqJ8Hh4e41dVt9Y1cZDrJx+29QQ=;
        b=CE3NDzJZUiGb2zKgSWJnZOOKzao2mvL0QGNsNzktPrSrrIVJ0Lt3KqLg4vY/dockJr
         eIK8lrTJ6HWk2y0jyRnhNe14wiMM/OMQFQVd4GTaP4xADEKY2ALaCXrneYQSKDk8chly
         q7c+hQmNyLaiktPupzbehm7KLbL8Xo8SwIWUi1we0axezx9z3X08Uc8l0ct+EpifAwII
         wEo3W0KRQpMvJO1JP2muNtIajCzdosh/kVVtRZh5TgUWpGFEXn5rn91iK4qA7c1Z1u+E
         GF1stPQo4vwWHYfeddMPq4814IjbRWqczWMDtpq7w/2HADYU/yGOsQgsSkhW502oMehP
         m0Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778151031; x=1778755831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEhC5xMmaOs+y5n/VqJ8Hh4e41dVt9Y1cZDrJx+29QQ=;
        b=FLId5SXg4lUTemUS+zkIbUwnHGq3N3LbFlwcinnlWRkJj13JZavLkyVdFKCH+NVKe9
         Y/jGqIdzG3l4/im3ILGbxaTA0MRly7GDFUhNHySLyu5JOmAC2wXc3auWWk0fKrUlBkEK
         XFA6ShJsx7mp+jdRy3C/u6wmlIfpFUobRXk1x+HsaDhmZLq+jo3/Uq+K/Ngy32MHvyyr
         mg2xZ6woUreeJ+4kEhqdOmwnqN7my+WR/wHuG3yBK6NfHm0pdDxGK178SPS9xbAvviRS
         mWq6SDb8L2VZVWITkhMILpV1xc3XlJaGeXzIxYyoxZ6oIOXmrmIXkcDCHWdM0znhzW8f
         1SRQ==
X-Forwarded-Encrypted: i=1; AFNElJ+tUdH/wCfi1qt3AZC3LZARDEHeB2aMJ8wgHUXpxPtdGcsVqaV+Ssudac6QwJEIAmw5gn+BRYYcuLk=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeL3OtqdkNRXARXW3yqd85PUVuqQgSc6aGP/g4Awfsl56UFLi3
	67YFh+iA22UU7koO0KjtXokKcgwUlkg6JNho3Xj+H/6QV5olQ5HmZNxbklw/k0BR7fo=
X-Gm-Gg: AeBDievicQb9y9evbCcF60S2cBA67jo9O4NWPI9aEwvk25kRsdTwstWUOw2gFAnxXpV
	coiLQSXzdvL2O1+FpnGw6yq8TvWJc4I3uqLhPfF82fayjYlepVkyKPSMPRIGb//yJ8lRoJw0w+T
	nvams0oYwGmmsUaUvqKcragLHxpCsjYex/PZdRYcI6v2w+iRJy/UHxvwol7FwNHX6arqGXFD1tO
	eXdTN7hMcWavHTxN4UK5p1rM7qIz5Usdk0j9AIWQTkMuQi/42ckXOXz3J9EE3h5irrz7l+Jbxkj
	x4vn2r3waDKOkxGf2DKCenNctzOLB97gk2QhVtzn5fEYnDrt3uPZBqfZ6VOFzKMUbpr54uiRxwy
	HyDTlYVyXzQAvOkA0AjxUwK0T16oWle1Hh9oe5pR3BIE1lmYtaoAVCSCzBxBwlgI3+gTCVqNtRm
	R1pwxHMtj0wtS1bexgZ0aZeo7ssfYOLuPdEn5/SVeb51cQzUQ++gzmCetHRgcVrB+iem7D/zZQx
	WKqOKJwjZorb90UqGIxPkt4Sw==
X-Received: by 2002:a05:600c:8485:b0:489:1f3e:5f6f with SMTP id 5b1f17b1804b1-48e51f327f0mr123646755e9.12.1778151031239;
        Thu, 07 May 2026 03:50:31 -0700 (PDT)
Received: from localhost (p200300f65f114e08ac341e0bb79e5496.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:ac34:1e0b:b79e:5496])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e52f5c1cfsm74709765e9.0.2026.05.07.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:50:30 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Michael Grzeschik <mgr@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Krzysztof Halasa <khc@pm.waw.pl>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Steffen Klassert <klassert@kernel.org>,
	David Dillow <dave@thedillows.org>,
	Ion Badulescu <ionut@badula.org>,
	Mark Einon <mark.einon@gmail.com>,
	Rasesh Mody <rmody@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Manish Chopra <manishc@marvell.com>,
	Potnuri Bharat Teja <bharat@chelsio.com>,
	Denis Kirjanov <kirjanov@gmail.com>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Fan Gong <gongfan1@huawei.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Mark Bloch <mbloch@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Petr Machata <petrm@nvidia.com>,
	Yibo Dong <dong100@mucse.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	nic_swsd@realtek.com,
	Jiri Pirko <jiri@resnulli.us>,
	Francois Romieu <romieu@fr.zoreil.com>,
	Daniele Venzano <venza@brownhat.org>,
	Samuel Chessman <chessman@tux.org>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Kevin Curtis <kevin.curtis@farsite.co.uk>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Stanislav Yakovlev <stas.yakovlev@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Zilin Guan <zilin@seu.edu.cn>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Arinzon <darinzon@amazon.com>,
	Yeounsu Moon <yyyynoom@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>,
	Yonglong Liu <liuyonglong@huawei.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Yicong Hui <yiconghui@gmail.com>,
	MD Danish Anwar <danishanwar@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Larysa Zaremba <larysa.zaremba@intel.com>,
	Ian Lin <ian.lin@infineon.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Double Lo <double.lo@cypress.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	linux-rdma@vger.kernel.org,
	oss-drivers@corigine.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: [PATCH net-next v2 0/2] Rework pci_device_id initialisation
Date: Thu,  7 May 2026 12:50:18 +0200
Message-ID: <cover.1778149923.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4997; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=F0wkHe4/N6VROpz2ZLwqmJpO+q0ZH2sv57Ij/hqtPPo=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp/G5qFf+kwY1/C2tNsDu68NrEVCGT2LoojUm6u vB+DhdxBCOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCafxuagAKCRCPgPtYfRL+ ThFhB/9Ez2Dcmcpa/NhWkEdoeFtCQpUSu198LS4+VzPV9EdL+/XzefS25l1M0IrceOE5nZvPQin 8PPeETGae282bLzXMlNHBjdiUzvMDpqRdzOGC58be7Gz/ifz4P9bWwvku+LAARTI4BqWD5itQdY lW6g7KjElH6oo6lmYarLW+mG55TSQQw5saxghG2zuvdG2pInp5obAmIWhCWdT0lDnNwXx0JDRCx IpeXpWeh5zmLqMCkWlOv0R22LTIdhKikJeJIFiKlpiOJ6cqZfn2tPQFUgRBIo5RnBBsyh99aLwX xcivYIzJoLo/aGXX+8avDoPmzCKP5DN4BCd3+qrRJR1skzlP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

(implicit) v1 is available at
https://lore.kernel.org/netdev/20260428171845.2288395-2-u.kleine-koenig@baylibre.com/.

Changes since then is mostly addressing feedback by Andy Shevchenko
about trailing commas, 4-digit PCI device ids. I did some more minor
reformatting.

Patch #2 is new. I considered putting that one first because the
conversion for the affected driver introduces the ambiguity that I
mentioned in the commit log, but decided to keep it after the rework
because only with the rework you can properly see the issue that .class
and .class_mask hold strange values.

I consider the changes to patch #1 minor enough to carry over all the
tags given to v1 to this v2.

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (2):
  net: Consistently define pci_device_ids using named initializers
  net: nfp: Drop PCI class entries with .class_mask = 0

 drivers/net/arcnet/com20020-pci.c             | 242 +++------
 drivers/net/can/m_can/m_can_pci.c             |   6 +-
 drivers/net/can/sja1000/plx_pci.c             | 167 +++----
 drivers/net/ethernet/3com/3c59x.c             |  80 +--
 drivers/net/ethernet/3com/typhoon.c           |  75 ++-
 drivers/net/ethernet/8390/ne2k-pci.c          |  24 +-
 drivers/net/ethernet/adaptec/starfire.c       |   4 +-
 drivers/net/ethernet/agere/et131x.c           |   6 +-
 drivers/net/ethernet/broadcom/bnx2.c          |  62 ++-
 .../net/ethernet/broadcom/bnx2x/bnx2x_main.c  |  50 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   |  10 +-
 .../ethernet/cavium/liquidio/lio_vf_main.c    |   7 +-
 drivers/net/ethernet/chelsio/cxgb/common.h    |   2 +-
 drivers/net/ethernet/chelsio/cxgb/subr.c      |   2 +-
 .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   |   4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |   4 +-
 .../ethernet/chelsio/cxgb4vf/cxgb4vf_main.c   |   4 +-
 drivers/net/ethernet/dec/tulip/de2104x.c      |   6 +-
 drivers/net/ethernet/dec/tulip/dmfe.c         |  12 +-
 drivers/net/ethernet/dec/tulip/tulip_core.c   |  78 +--
 drivers/net/ethernet/dec/tulip/uli526x.c      |   6 +-
 drivers/net/ethernet/dec/tulip/winbond-840.c  |  13 +-
 drivers/net/ethernet/dlink/dl2k.h             |  12 +-
 drivers/net/ethernet/dlink/sundance.c         |  14 +-
 drivers/net/ethernet/fealnx.c                 |   8 +-
 .../net/ethernet/hisilicon/hibmcge/hbg_main.c |   2 +-
 .../net/ethernet/hisilicon/hns3/hns3_enet.c   |  50 +-
 .../hisilicon/hns3/hns3pf/hclge_main.c        |  18 +-
 .../hisilicon/hns3/hns3vf/hclgevf_main.c      |  12 +-
 .../net/ethernet/huawei/hinic/hinic_main.c    |  12 +-
 .../net/ethernet/huawei/hinic3/hinic3_lld.c   |   7 +-
 drivers/net/ethernet/intel/e100.c             |   9 +-
 drivers/net/ethernet/intel/e1000e/netdev.c    | 471 +++++++++++++-----
 drivers/net/ethernet/intel/fm10k/fm10k_pci.c  |  10 +-
 drivers/net/ethernet/intel/i40e/i40e_main.c   |  59 +--
 drivers/net/ethernet/intel/iavf/iavf_main.c   |  10 +-
 drivers/net/ethernet/intel/igb/igb_main.c     |  66 +--
 drivers/net/ethernet/intel/igbvf/netdev.c     |   4 +-
 drivers/net/ethernet/intel/igc/igc_main.c     |  34 +-
 drivers/net/ethernet/intel/ixgbe/ixgbe_main.c | 106 ++--
 .../net/ethernet/intel/ixgbevf/ixgbevf_main.c |  49 +-
 drivers/net/ethernet/mellanox/mlx4/main.c     |   6 +-
 .../net/ethernet/mellanox/mlx5/core/main.c    |  26 +-
 .../net/ethernet/mellanox/mlxsw/spectrum.c    |  16 +-
 drivers/net/ethernet/micrel/ksz884x.c         |   8 +-
 .../net/ethernet/mucse/rnpgbe/rnpgbe_main.c   |  10 +-
 drivers/net/ethernet/natsemi/natsemi.c        |   4 +-
 drivers/net/ethernet/netronome/nfp/nfp_main.c |  65 +--
 .../ethernet/netronome/nfp/nfp_netvf_main.c   |  33 +-
 drivers/net/ethernet/qlogic/qede/qede_main.c  |  20 +-
 drivers/net/ethernet/realtek/8139too.c        |  52 +-
 drivers/net/ethernet/realtek/r8169_main.c     |   8 +-
 drivers/net/ethernet/rocker/rocker_main.c     |   4 +-
 drivers/net/ethernet/sis/sis190.c             |   6 +-
 drivers/net/ethernet/sis/sis900.c             |  10 +-
 drivers/net/ethernet/smsc/epic100.c           |  18 +-
 drivers/net/ethernet/sun/cassini.c            |   8 +-
 drivers/net/ethernet/sun/sungem.c             |  26 +-
 drivers/net/ethernet/ti/tlan.c                |  41 +-
 drivers/net/ethernet/wangxun/ngbe/ngbe_main.c |  26 +-
 .../net/ethernet/wangxun/ngbevf/ngbevf_main.c |  26 +-
 .../net/ethernet/wangxun/txgbe/txgbe_main.c   |  18 +-
 .../ethernet/wangxun/txgbevf/txgbevf_main.c   |  18 +-
 drivers/net/wan/farsync.c                     |  24 +-
 drivers/net/wan/pc300too.c                    |  14 +-
 drivers/net/wan/pci200syn.c                   |   6 +-
 drivers/net/wan/wanxl.c                       |  11 +-
 .../broadcom/brcm80211/brcmfmac/pcie.c        |  17 +-
 drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  52 +-
 69 files changed, 1288 insertions(+), 1102 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3

