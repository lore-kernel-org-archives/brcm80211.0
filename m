Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79187384
	for <brcm80211@lists.linux.dev>; Wed, 21 Feb 2024 00:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708475207; cv=none; b=uA5uon9nFqmw3V+xI1Ds8m7Wq3xpYe75YHEUilRQSiUBL8TKzvod/WTp+YbXbmKlSvmtGXJazgxXKGcxjJ8qYrLJtH2f+9cRL+qmQhDT4IPDVZPqWwnIM+18c6Y+BpsnSFt50qnUnuiH0sX+0f0NikHZthf4cDtGTOFUOfOmnkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708475207; c=relaxed/simple;
	bh=lpJ/zYgpZIvJEgWfAsVJfCMFcwkbGO9VQUlaRq9tM0c=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=q0YbGnqclKDFaeSXRIQzhzdq+8K88IGrD8AOL8o3NopEavfAOt7rfKatqSpJI/ld3a5dcaS9wC2QNdPzvzSVsdhMyK8Pyjw+fSuw4CkTH5gNHhYQwVzg7b3ZhdRtIUIuN4YP3e3NlJWo5bI+/G4AhuganPeinko5aRnjuA4kMLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQwAhm7N; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQwAhm7N"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5ce2aada130so5389280a12.1
        for <brcm80211@lists.linux.dev>; Tue, 20 Feb 2024 16:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708475205; x=1709080005; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lpJ/zYgpZIvJEgWfAsVJfCMFcwkbGO9VQUlaRq9tM0c=;
        b=aQwAhm7NSsSlzSYV3Ozi6d9IuADpbHMW/u/5meIRG/irUQHMKvqFV/+GaYXlnczZ2V
         aMi5Qbwe6Tob8SpHzQLC5M0U/Q241G4adLVqiJWgaRX6HKQXwmlhk4VakkXrSJU5fM+P
         5KOl8djcOrrMp2fsiCmF7MSfRxN9Q9gwtzObwXPWQwaup0e4y+Z+U90cr+cgUuVOsYYW
         PsTMUYopql2RFatlYAy8VrnNekl2MrnF9g4KSsp+9pjw+AyKVeA8fuNomvALsfx4M3VZ
         bznD194DOgLjcuYrzFZFoix+RwGlRUMx+bnXgsi6JtYJpGGej2YWJj5jHCY7w32yR6A6
         bgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708475205; x=1709080005;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lpJ/zYgpZIvJEgWfAsVJfCMFcwkbGO9VQUlaRq9tM0c=;
        b=B8Zb+yHJ2N4MUVXAETQMyS+W3Ef24lN136Da8K+/1d5OOu2bDfQwJRSrlJ+YCvuv7u
         IxFm/jo8OvI//DLV892CGrgiz4tICRPXuIM9SUdV4DQhIufxsmVVlRactuEp4mMPWQtg
         fQkj4TBV2czemMDGVu0hg1Un3oR7NIC0UQs9/EayXTHJ6RR2zeT5yZtVECvhAZOlICnB
         HUOydOGx90gE8Pd9ydiInp/dKTV0rNYxx4l2GQ0sAjJiajntZCg+dFLNIWiZXKS1/vkL
         cxTWfK+30110+YKM0ahC2Yi7ldFBgVtkx00e7NUtVokXSFhFVkU3VcxJdbVPXhmzVUm6
         X2CA==
X-Gm-Message-State: AOJu0YwuDFxwjHBpBP3YzMK+Fs9idw66rWgbquWHtSgnN/LcJXPvES+c
	CQj39xBZZyaML5iw9lMlET614FQuMN4QWXhHETM2xBNwstXVZ67uHW2O0FXcTXPFMXwGl2R7Bd9
	cBzUlW2BSs+V6UWEAH0yWpYE+D0foUV81
X-Google-Smtp-Source: AGHT+IFVXQJPxeUGFRmZArCVwiUwBajvC36B/8wF1Z9iV3og869qKgLg0mUjtRwZgzt3rSBjROnqVKv86x25lMsVFS4=
X-Received: by 2002:a17:90b:1048:b0:29a:12c9:9ca9 with SMTP id
 gq8-20020a17090b104800b0029a12c99ca9mr158005pjb.47.1708475205387; Tue, 20 Feb
 2024 16:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: KeithG <ys3al35l@gmail.com>
Date: Tue, 20 Feb 2024 18:26:34 -0600
Message-ID: <CAG17S_NgSOPg72_oNOvGsNr_nt5xmbNu4MGPDuVtb2UWjUnnJg@mail.gmail.com>
Subject: brcmfmac disconnects AP mode while scanning
To: brcm80211@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

I posted this over on the linux-wireless board as well but did not
learn much towards a fix.

We are using iwd to manage the wireless on RPis. We discovered that
when the brcmfmac in the Pi is set to be in AP mode and then iwd
initiates a scan on the interface, all clients on the AP are
disconnected. This is unexpected and does not happen when
wpa_supplicant is used then scans.

I have been discussing this with one of the IWD devs and he pinpointed
it to the fact that when iwd scans, it is using 'passive scan' to scan
for ssids and when it does it shuts down the AP. We do not witness
this behavior with intel cards and it also does not happen when
wpa_supplicant is used instead of iwd and then it scans for ssids. The
dev determined that wpa_suplicant uses 'active scan' and when it scans
for ssids whereas iwd uses 'passive scan'. Our Pis are stable with
wpa_supplicant/Hostapd, but not with iwd. We prefer using iwd.

He passed on some patches that change the behavior of iwd to only use
'active scans'. With iwd built with these patches (only to use active
scan) the AP is stable when iwd scans for ssids.
This behavior/modification is not consistent with other cards, though.
The question is: why are we seeing this behavior on brcmfmac? Is
wpa_suplicant doing it properly and iwd not? If so, why? Could the
brcmfmac driver be patched so that iwd will work properly with a
passive scan and not disconnect all AP connected clients?

Keith
