Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9BF2ECEA8
	for <brcm80211@lists.linux.dev>; Tue, 15 Jul 2025 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752587183; cv=none; b=pUodVorbg6ZJvkB4yaXzCX3OfWXK3rCho0k4Dsja+6rO/+iCihbNwsWDuhcS3xnT9iRdnLO5uCh5pQ3xNA/LNDycuCEcONJlQCEliPazp4sS58vcCuXwDrkVS2z3Jo4oBlY+WmWIKVYEKRhMjUi8g7Twq6yxUa03O3XKOcihQQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752587183; c=relaxed/simple;
	bh=NHY04lWbnuGt7TUMVXMBAd99xrE3nzf7tN3dhvAdpFk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qe3X+8cRw6p5oEHZg07K3VolU6FO2tO30I07LlE+pXV0ssrbpbSCqfbdcWT8KVP7RhZQzOpSGylFaYxCZVJeuSOyIDzfF6IalcUbp5kVuiv1+m8E9uBtW88S/fXdbUypxzf0OGGrcJvwlWtOsbnB4/rWBlUr3ezEaY7CLoyjZu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=L7T2ccFh; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="L7T2ccFh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1752587152;
	bh=NWDrOIeUTkfMgeyG9DirCptVDnqPmotqOLDK+VZpCcc=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=L7T2ccFhTmKG3T6mh99/NWel04UXnbnWQG6H0UsAuRVoyzg0rSWMDQ6CfsGkWl33k
	 +qzhfTCd+IfyTEwSQEhSnfW2Nu6TBzcLfzdaXYa89VWv40tRLzf/axMm3ldWw220cL
	 97y04t2d1nAvgy4g4V5utln46rvikis/m/9sdMs0=
X-QQ-mid: zesmtpip2t1752587129tb54538eb
X-QQ-Originating-IP: PsIrTfnu37O5BQpc09CPKOeWtbwmOWY2B4qF0spybKw=
Received: from avenger-e500 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 15 Jul 2025 21:45:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 9443703254596192763
EX-QQ-RecipientCnt: 63
From: WangYuli <wangyuli@uniontech.com>
To: wangyuli@uniontech.com
Cc: airlied@gmail.com,
	akpm@linux-foundation.org,
	alison.schofield@intel.com,
	andrew+netdev@lunn.ch,
	andriy.shevchenko@linux.intel.com,
	arend.vanspriel@broadcom.com,
	bp@alien8.de,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	colin.i.king@gmail.com,
	cvam0000@gmail.com,
	dan.j.williams@intel.com,
	dave.hansen@linux.intel.com,
	dave.jiang@intel.com,
	dave@stgolabs.net,
	davem@davemloft.net,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	gregkh@linuxfoundation.org,
	guanwentao@uniontech.com,
	hpa@zytor.com,
	ilpo.jarvinen@linux.intel.com,
	intel-xe@lists.freedesktop.org,
	ira.weiny@intel.com,
	j@jannau.net,
	jeff.johnson@oss.qualcomm.com,
	jgross@suse.com,
	jirislaby@kernel.org,
	johannes.berg@intel.com,
	jonathan.cameron@huawei.com,
	kuba@kernel.org,
	kvalo@kernel.org,
	kvm@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	linux@treblig.org,
	lucas.demarchi@intel.com,
	marcin.s.wojtas@gmail.com,
	ming.li@zohomail.com,
	mingo@kernel.org,
	mingo@redhat.com,
	netdev@vger.kernel.org,
	niecheng1@uniontech.com,
	oleksandr_tyshchenko@epam.com,
	pabeni@redhat.com,
	pbonzini@redhat.com,
	quic_ramess@quicinc.com,
	ragazenta@gmail.com,
	rodrigo.vivi@intel.com,
	seanjc@google.com,
	shenlichuan@vivo.com,
	simona@ffwll.ch,
	sstabellini@kernel.org,
	tglx@linutronix.de,
	thomas.hellstrom@linux.intel.com,
	vishal.l.verma@intel.com,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	yujiaoliang@vivo.com,
	zhanjun@uniontech.com
Subject: [PATCH v2 8/8] scripts/spelling.txt: Add notifer||notifier to spelling.txt
Date: Tue, 15 Jul 2025 21:44:07 +0800
Message-ID: <A205796B545C4241+20250715134407.540483-8-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
References: <BD5C52D2838AEA48+20250715134050.539234-1-wangyuli@uniontech.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NfZ1G3mfsVwmGGfmgJkLyMvl+VoDzXXq2IYtJWnKuWo9l1qkey4A26Hv
	SvTEwKhn6on76DtphpKDmnp2WJC9f2R3CDWC5laPHEPT/iOJA+2/pv/COPzFg6M0QTwvf+D
	6ttVN9VDRkD8+zvL3VCyoPUHl7z73gjejIf/ZS5VVanhM9+31ucc7w43aOiU6lFiOjLulW7
	Rr567Y28DdcRkaB6sa9mPRFZZBRu3p+FN/bDbYSIf3gpu3WpwmfkwXpBmhJVdQItsAzAWbb
	fhbcuJjtFMUUwV0uevVM+8jQTvCqoklXnwQDkGQ3xCW9Rvf3JdqzfjOj8C49Of6ebzL+PGN
	335BovIcz/ABfWYTwC107g4rwWYNu4r6nOoLFYbYpmYWygKfcoOQBiBibJTbIRw284jwJIg
	rNJytL+dtSOMFAv3uCsMgDyN6GOuEj9vP8GsAbkTYzl1zM026u6566/OnrXTWhuAQZqQzq4
	jTbbWRgbgqHZABH0r99LHELaQQQUXu0rYb+WFPCYcj/FpokvDuwS2zkvT/4HhsQWG9eIPLj
	/d2WHb65dpLtMvqvBime6RBUNRZvpBRrT6GUjfhJO4HceuerfXJ8QUw/bLNECBsBskU0Yp8
	1Ug3J5ggzGnRCvxFQJWKxdkHDWxb3Jw492fNdsvrdAJWNhv6nO4tuGWgbcWiMiiPdwXkNmn
	o2cHF5Jj+289BRT3rDSw9hiBrQ7/0RGpqA5G1fMy8iGvQdpvK0aeqwsOSwRb5TKaTgZMZRr
	G0p81zwr/E1K7Mn/2p2wfPpniCL4LrOrSSLo4Gb3p08WIM69mdvanMKFsHXmd0/fXZfpmUm
	rgPVOA2r/NwFBE9h8n1ey7xQ0RJk8akgFJXQIMxf8yGwtepIngU3xFtEPC9EQ6jZyu7iwfe
	xQUP3jG+j7xTUXHl3wogbx23sk7NyZGueojSPbb2CGbqUpnQSvaZG56gBZ7jVWEhppQaZjR
	PWmBCLtR52wESklVmJo8+EPR7fTjC4ZZwrqfHy6nKCJmW5uKAX4AfUJr969cB1pvvMXf5X3
	IOXqWGfFbBBbYGXmkAQFEo3C2IgrFRWzNp3h9jUoNNtKIDzj+9KCfRcqMCfWRCzpRMpdMrV
	PhpUXh8Je5z
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

This typo was not listed in scripts/spelling.txt, thus it was more
difficult to detect. Add it for convenience.

Link: https://lore.kernel.org/all/B3C019B63C93846F+20250715071245.398846-1-wangyuli@uniontech.com/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 scripts/spelling.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/spelling.txt b/scripts/spelling.txt
index c9a6df5be281..d824c4b17390 100644
--- a/scripts/spelling.txt
+++ b/scripts/spelling.txt
@@ -1099,6 +1099,7 @@ notication||notification
 notications||notifications
 notifcations||notifications
 notifed||notified
+notifer||notifier
 notity||notify
 notfify||notify
 nubmer||number
-- 
2.50.0

